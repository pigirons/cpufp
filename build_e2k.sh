SRC=e2k
COMM=common
BUILD_DIR=build_dir

# make directory
if [ -d "$BUILD_DIR" ]; then
    rm -rf $BUILD_DIR/*
else
    mkdir $BUILD_DIR
fi

# build common tools
l++ -O3 -c $COMM/table.cpp -o $BUILD_DIR/table.o
l++ -O3 -pthread -c $COMM/smtl.cpp -o $BUILD_DIR/smtl.o

# assembler implementation is selected by __iset__ at compile time
l++ -c $SRC/asm.S -o $BUILD_DIR/asm.o

# compile cpufp
l++ -O3 -I$COMM -c $SRC/cpufp.cpp -o $BUILD_DIR/cpufp.o
l++ -O3 -z noexecstack -pthread -o cpufp $BUILD_DIR/cpufp.o $BUILD_DIR/smtl.o $BUILD_DIR/table.o $BUILD_DIR/asm.o
