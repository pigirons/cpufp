#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
CXX=${CXX:-c++}
# Run ./build_arm64.sh first. This test intentionally uses baseline code around
# the ISA-specific objects, just like the benchmark dispatcher.
ABI_OBJECT=""
if [ -n "$(sed -n '/-D_SME_/p' build_dir/arm64_macros)" ]; then
    $CXX ${CPPFLAGS:-} ${CXXFLAGS:-} -std=c++11 -O2 -march=armv8-a+sme \
        -c tests/test_sme_abi.cpp -o build_dir/test_sme_abi.o
    ABI_OBJECT=build_dir/test_sme_abi.o
fi
$CXX ${CPPFLAGS:-} ${CXXFLAGS:-} -std=c++11 -O2 -march=armv8-a -pthread \
    $(cat build_dir/arm64_macros) tests/test_arm64.cpp build_dir/features.o \
    $(cat build_dir/arm64_objects) $ABI_OBJECT $(cat build_dir/arm64_link_flags) ${LDFLAGS:-} ${LDLIBS:-} -o build_dir/test_arm64
${CPUFP_RUNNER:-} ./build_dir/test_arm64
