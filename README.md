# CIRCT-SYS
A rust system-level binding to [circt](https://circt.llvm.org).

**This repository is heavily based on the work of [Moore](https://github.com/fabianschuiki/moore)**

### Installation
* Clone Circt
```bash
git clone https://github.com/llvm/circt
cd circt
git submodule update --init --recursive
```
* Build LLVM
```bash
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
```

* Build Circt
```bash
cd ../../
mkdir build
cd build
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DMLIR_DIR=$PWD/../llvm/build/lib/cmake/mlir \
    -DLLVM_DIR=$PWD/../llvm/build/lib/cmake/llvm \
    -DLLVM_ENABLE_ASSERTIONS=ON
cmake --build . -j
```

* Setup Environment
```bash
cd ..
export CIRCT_SYS_CIRCT_DIR=$PWD
export CIRCT_SYS_CIRCT_BUILD_DIR=$PWD/build
export CIRCT_SYS_LLVM_DIR=$PWD/llvm
export CIRCT_SYS_LLVM_BUILD_DIR=$PWD/llvm/build
```

* Setup circt-sys
```bash
git clone https://github.com/Entropy-xcy/circt-sys
cd circt-sys
cargo build
```
