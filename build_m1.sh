SRC=arm64
ASM=$SRC/asm
COMM=common
BUILD_DIR=build_dir

# make directory
if [ -d "$BUILD_DIR" ]; then
    rm -rf $BUILD_DIR/*
else
    mkdir $BUILD_DIR
fi

# build common tools
g++ --std=c++11 -O3 -c $COMM/table.cpp -o $BUILD_DIR/table.o
g++ --std=c++11 -O3 -pthread -c $COMM/smtl.cpp -o $BUILD_DIR/smtl.o

SIMD_MACRO=" "
SIMD_OBJ=" "
for SIMD in "_ASIMD_" "_ASIMD_HP_" "_ASIMD_DP_";
do
    SIMD_MACRO="$SIMD_MACRO-D$SIMD "
    SIMD_OBJ="$SIMD_OBJ$BUILD_DIR/$SIMD.o "
    as -c $ASM/$SIMD.S -o $BUILD_DIR/$SIMD.o
done

# compile cpufp
g++ --std=c++11 -O3 -I$COMM $SIMD_MACRO -c $SRC/cpufp.cpp -o $BUILD_DIR/cpufp.o
g++ --std=c++11 -O3 -pthread -o cpufp $BUILD_DIR/cpufp.o $BUILD_DIR/smtl.o $BUILD_DIR/table.o $SIMD_OBJ
