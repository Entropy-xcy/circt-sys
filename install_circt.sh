git clone https://github.com/llvm/circt
cd circt
git submodule update --init --recursive

cd llvm
mkdir build
cd build
cmake ../llvm \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_BUILD_EXAMPLES=OFF \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_ENABLE_OCAMLDOC=OFF \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_OPTIMIZED_TABLEGEN=ON \
    -DLLVM_TARGETS_TO_BUILD="host"
cmake --build . -j

cd ../../
mkdir build
cd build
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DMLIR_DIR=$PWD/../llvm/build/lib/cmake/mlir \
    -DLLVM_DIR=$PWD/../llvm/build/lib/cmake/llvm \
    -DLLVM_ENABLE_ASSERTIONS=ON
cmake --build . -j

cd ..
echo "export CIRCT_SYS_CIRCT_DIR=$PWD" >> env.sh
echo "export CIRCT_SYS_CIRCT_BUILD_DIR=$PWD/build" >> env.sh
echo "export CIRCT_SYS_LLVM_DIR=$PWD/llvm" >> env.sh
echo "export CIRCT_SYS_LLVM_BUILD_DIR=$PWD/llvm/build" >> env.sh
