#!/bin/sh
set -eu
cd "$(dirname "$0")"

CC=${CC:-cc}
CXX=${CXX:-c++}
BUILD_DIR=build_dir
mkdir -p "$BUILD_DIR"

# Keep the dispatcher and thread pool at the baseline ISA. Extensions are
# enabled only in their own objects, including on SME-only Apple CPUs.
$CC ${CPPFLAGS:-} ${CFLAGS:-} -O3 -march=armv8-a -c arm64/features.c -o "$BUILD_DIR/features.o"
$CC ${CPPFLAGS:-} ${CFLAGS:-} -O3 arm64/cpuid.c "$BUILD_DIR/features.o" -o "$BUILD_DIR/cpuid"
$CXX ${CPPFLAGS:-} ${CXXFLAGS:-} -std=c++11 -O3 -c common/table.cpp -o "$BUILD_DIR/table.o"
$CXX ${CPPFLAGS:-} ${CXXFLAGS:-} -std=c++11 -O3 -pthread -c common/smtl.cpp -o "$BUILD_DIR/smtl.o"

ISAS=${CPUFP_ARM_ISAS:-$("$BUILD_DIR/cpuid")}
MACROS=""
OBJECTS=""
for ISA in $ISAS; do
    SOURCE="arm64/asm/$ISA.S"
    case "$ISA" in
        _ASIMD_) FLAGS="-march=armv8-a" ;;
        _ASIMD_HP_) FLAGS="-march=armv8.2-a+fp16" ;;
        _ASIMD_DP_) FLAGS="-march=armv8.2-a+dotprod" ;;
        _BF16_) FLAGS="-march=armv8.2-a+bf16" ;;
        _I8MM_) FLAGS="-march=armv8.2-a+i8mm" ;;
        _SVE_) FLAGS="-march=armv8-a+sve" ;;
        _SVE2_) FLAGS="-march=armv8-a+sve2" ;;
        _SME_) FLAGS="-march=armv8-a+sme"; SOURCE="arm64/$ISA.cpp" ;;
        _SME2_) FLAGS="-march=armv8-a+sme2"; SOURCE="arm64/$ISA.cpp" ;;
        *) echo "Unknown ARM ISA: $ISA" >&2; exit 1 ;;
    esac
    # The compiler driver preprocesses .S and selects ELF/Mach-O correctly.
    if $CXX ${CPPFLAGS:-} ${CXXFLAGS:-} -O3 $FLAGS -c "$SOURCE" -o "$BUILD_DIR/$ISA.o" 2>"$BUILD_DIR/$ISA.log"; then
        MACROS="$MACROS -D$ISA"
        OBJECTS="$OBJECTS $BUILD_DIR/$ISA.o"
        echo "Enabled $ISA ($FLAGS)"
    else
        case "$ISA" in
            _SVE*|_SME*)
                echo "Warning: compiler cannot build $ISA; skipped (see $BUILD_DIR/$ISA.log)." >&2 ;;
            *) cat "$BUILD_DIR/$ISA.log" >&2; exit 1 ;;
        esac
    fi
done

# An SME2 build needs the SME vector-length helper. Do not leave an undefined
# symbol if an older compiler supports SME2 assembly but lacks SME ACLE support.
case "$MACROS" in
    *-D_SME2_*)
        case "$MACROS" in
            *-D_SME_*) ;;
            *) echo "SME2 requires _SME_ in CPUFP_ARM_ISAS and a working SME compiler." >&2; exit 1 ;;
        esac ;;
esac
case "$MACROS" in
    *-D_SVE2_*)
        case "$MACROS" in
            *-D_SVE_*) ;;
            *) echo "SVE2 requires _SVE_ in CPUFP_ARM_ISAS." >&2; exit 1 ;;
        esac ;;
esac

$CXX ${CPPFLAGS:-} ${CXXFLAGS:-} -std=c++11 -O3 -march=armv8-a -Icommon $MACROS -c arm64/cpufp.cpp -o "$BUILD_DIR/cpufp.o"
LINK_FLAGS=""
if [ "$(uname -s)" = Linux ]; then LINK_FLAGS="-Wl,-z,noexecstack"; fi
link_cpufp()
{
    $CXX ${LDFLAGS:-} $LINK_FLAGS -pthread -o cpufp "$BUILD_DIR/cpufp.o" \
        "$BUILD_DIR/features.o" "$BUILD_DIR/smtl.o" "$BUILD_DIR/table.o" $OBJECTS ${LDLIBS:-}
}
if ! link_cpufp 2>"$BUILD_DIR/link.log"; then
    # Clang can emit newer SME ABI helpers than an installed libgcc provides.
    # Use its matching runtime if available; never replace helpers with stubs.
    RETRY=no
    case "$MACROS" in
        *-D_SME_*)
            if [ "$(uname -s)" = Linux ] && $CXX --version | head -n 1 | grep -qi clang; then
                RETRY=yes
            fi ;;
    esac
    if [ "$RETRY" = yes ]; then
        LINK_FLAGS="$LINK_FLAGS --rtlib=compiler-rt --unwindlib=libgcc"
        if link_cpufp 2>"$BUILD_DIR/link_compiler_rt.log"; then
            echo "Linked with compiler-rt for SME ABI support."
        else
            cat "$BUILD_DIR/link.log" "$BUILD_DIR/link_compiler_rt.log" >&2
            echo "Install the matching AArch64 compiler runtime, or select it with LDFLAGS/LDLIBS." >&2
            exit 1
        fi
    else
        cat "$BUILD_DIR/link.log" >&2
        exit 1
    fi
fi
printf '%s\n' "$LINK_FLAGS" > "$BUILD_DIR/arm64_link_flags"
# Reuse the exact build feature set for the numerical kernel test.
printf '%s\n' "$MACROS" > "$BUILD_DIR/arm64_macros"
printf '%s\n' "$OBJECTS" > "$BUILD_DIR/arm64_objects"
