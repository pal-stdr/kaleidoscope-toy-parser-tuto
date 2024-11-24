# Kaleidoscope Parser Tutorial

- Based on [My First Language Frontend with LLVM Tutorial](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)

- **(Only once you have to do it!!! 😇)** Please read the **Pre-requisites** section of [docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md](docs/KALEIDOSCOPE/0.SETTING-UP-BOILERPLATE/1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md).

- Use `VScode` editor for better developer UX if you are using linux.


# TUTORIAL INDEX (git branch wise)

### Chapter 0: SETTING-UP BOILERPLATE
- `ch-0-0-init-basic-boilerplate`: Setup of the basic boilerplate with `g++` compiler.
- `ch-0-1-add-llvm-clang-compiler`: Setup the `clang++` compiler to build this project.

### Chapter 1: SETTING-UP LEXER
- `ch-1-0-parse-and-print-toy-input-code`: Parse [toy example code](test-code-samples/Examples/kaleidoscope) as input and print in terminal.
- More coming....



# Chapter 1-0 (`ch-1-0-parse-and-print-toy-input-code` branch)

## Objective

- **Parse input [toy code samples](test-code-samples/Examples/kaleidoscope) as input and print in terminal. (i.e. `kaleidoscope-parser path/to/sample.toy`)**

- **Learn how you can use llvm assets to take code as input [docs/KALEIDOSCOPE/1.SETUP-LEXER/0.PARSE-and-PRINT-SIMPLE-TOY-INPUT-CODE.md](docs/KALEIDOSCOPE/1.SETUP-LEXER/0.PARSE-and-PRINT-SIMPLE-TOY-INPUT-CODE.md).**

- `main` Entry point [`src/kaleidoscope-parser-main.cpp`](src/kaleidoscope-parser-main.cpp).



## How to Compile

```sh
./build.sh
```


## How to run the binary?

```sh
# Parse an example toy input code and check the output in the terminal
./build/kaleidoscope-parser test-code-samples/Examples/kaleidoscope/test-cases/1.parse-func-defn.toy
```


## Project Scaffold (Upto now)

```sh
├── build
│   └── kaleidoscope-parser # bin to run
├── build.sh # <== Compile (& or run)
├── docs
│   ├── GIT-DOCS
│   │   └── 1.PLAY-with-GIT-SUBMODULES.md
│   └── KALEIDOSCOPE
│       ├── 0.SETTING-UP-BOILERPLATE
│       │   ├── 0.INIT-BOILERPLATE.md
│       │   └── 1.ADD-and-BUILD-CLANG-LLVM-COMPILER.md
│       └── 1.SETUP-LEXER
│           └── 0.PARSE-and-PRINT-SIMPLE-TOY-INPUT-CODE.md # <== newly added doc
├── README.md
├── scripts
│   └── build-llvm-19.sh
├── src
│   ├── include
│   └── kaleidoscope-parser-main.cpp # <== Main "*.cpp" file
└── test-code-samples # <== newly added
    └── Examples
        ├── kaleidoscope
        │   ├── basic_toy_sample.toy
        │   ├── extern_toy_sample.toy
        │   └── test-cases
        │       └── 1.parse-func-defn.toy
        └── Toy
            ├── Ch1
            ├── Ch2
            ├── Ch3
            ├── Ch4
            ├── Ch5
            ├── Ch6
            └── Ch7
```

