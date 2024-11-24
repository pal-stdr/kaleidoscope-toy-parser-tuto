# Kaleidoscope Parser Tutorial

- Based on [My First Language Frontend with LLVM Tutorial](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)


# Pre-requisite

- **(Only once you have to do it!!! 😇)** Please read the **Pre-requisites** section of [docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md](docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md).

- for llvm, `release/19.x` branch has been used.

- Use `VScode` editor for better developer UX if you are using linux.


# TUTORIAL INDEX (git branch wise)

- `ch-0-0-init-basic-boilerplate`: Setup of the basic boilerplate with `g++` compiler.
- `ch-0-1-add-llvm-clang-compiler`: Setup the `clang++` compiler to compile this project.
- More coming....


# Chapter 0-1 (`ch-0-1-add-llvm-clang-compiler` branch)


## Objectives

- **Our objective is to make a parser using `llvm` assets. So it's logical to compile this project using clang bin (i.e. `clang++`), headers (`*.{h, hpp}`), libs `*.so`, etc.**

- **Building `clang++` here in the project-root ensures the availability of all the required clang headers (`*.{h, hpp}`), libs `*.so`, etc. We donot need any outside dependency.**

- **Setup `clang++` compiler to compile this project. Use [`scripts/build-llvm-19.sh`](scripts/build-llvm-19.sh) to build `clang++`.**

- **(IMPORTANT!!! Only once you have to do it)** Read the **Pre-requisites** section of [docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md](docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md). There you will find the `llvm-19-src` build process. For summary, following is how to build the `clang` (i.e. `llvm-19` from src)...

```sh
# Sync first
git submodule sync

# Load llvm-project src
git submodule update --init

# build
./scripts/build-llvm-19.sh

# You will see "llvm-19-src-build", "llvm-19-src-build-installation" created in the project root with all llvm assets.
# They will be used in "build.sh"
```

- `llvm-19-src-build` & `llvm-19-src-build-installation` dir will be used as assets for compiler config in `build.sh`.

- `main` Entry point [`src/kaleidoscope-parser-main.cpp`](src/kaleidoscope-parser-main.cpp).

- Just printing `Welcome to the kaleidoscope`.

- - Reconfigure [`build.sh`](build.sh) with llvm assets to compile the `kaleidoscope-parser` using `clang++` compiler.


# How to Compile + Run

```sh
./build.sh

# Returns
# Don't worry about the warnings.
/path/to/kaleidoscope-toy-parser-tuto/src/kaleidoscope-parser-main.cpp:6:14: warning: unused parameter 'argc' [-Wunused-parameter]
    6 | int main(int argc, char **argv) {
      |              ^
/path/to/kaleidoscope-toy-parser-tuto/src/kaleidoscope-parser-main.cpp:6:27: warning: unused parameter 'argv' [-Wunused-parameter]
    6 | int main(int argc, char **argv) {
      |                           ^
2 warnings generated.
Welcome to the Kaleidoscope
```


# Where is the binary?

```sh
build/kaleidoscope-parser
```



## Project Scaffold

```sh
├── build
│   └── kaleidoscope-parser
├── build.sh # <== Compile & run
├── docs
│   ├── GIT-DOCS
│   │   └── 1.PLAY-with-GIT-SUBMODULES.md
│   └── KALEIDOSCOPE
│       └── 0.SETTING-UP-BOILERPLATE
│           ├── 0.INIT-BOILERPLATE.md
│           └── 1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md # <== (Tuto) How to build clang compiler
├── llvm-19-src # <== llvm-project src for branch "release/19.x"
├── llvm-19-src-build # <== after build
├── llvm-19-src-build-installation # <== after build & dumping all bin, header, libs here
├── README.md
├── scripts
│   └── build-llvm-19.sh # <== Shell for building clang compiler
└── src
    ├── include
    └── kaleidoscope-parser-main.cpp # <== Main "*.cpp" file
```
