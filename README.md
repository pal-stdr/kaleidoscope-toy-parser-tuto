# Kaleidoscope Parser Tutorial

- Based on [My First Language Frontend with LLVM Tutorial](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)


# Pre-requisite

```sh
# Installs gcc, g++ etc.
sudo apt-get install build-essential
```


# TUTORIAL INDEX (git branch wise)

- `ch-0-0-init-basic-boilerplate`: Setup of the basic boilerplate with `g++` compiler.


# Chapter 0-0: Setup Basic Boilerplate

- Read [`docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/0.INIT-BOILERPLATE.md`](docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/0.INIT-BOILERPLATE.md).

- `main` Entry point [`src/kaleidoscope-parser-main.cpp`](src/kaleidoscope-parser-main.cpp).

- Just printing `Welcome to the Kelaidoscope`.

- Compilation is done using `g++` compiler.

## Project Scaffold

```sh
├── build
│   └── kaleidoscope-parser-main
├── build.sh # <== Compile & run
├── docs
│   └── KALEIDOSCOPE
│       └── 0.SETTING-UP-BOILERPLATE
│           └── 0.INIT-BOILERPLATE.md
├── README.md
└── src
    ├── include/
    └── kaleidoscope-parser-main.cpp # <== Main file
```


# How to Compile + Run

```sh
./build.sh

# Returns

```

# Where is the binary?

```sh
build/kaleidoscope-parser
```
