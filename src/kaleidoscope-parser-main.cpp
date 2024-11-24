#include <iostream>



#include "llvm/ADT/StringRef.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"
// #include "llvm/Support/ErrorOr.h"
// #include "llvm/Support/raw_ostream.h"


namespace cl = llvm::cl;



/// @brief LLVM scalar CLI option config for taking input file (i.e. "filename.toy").
static cl::opt<std::string> inputFileName(
    cl::Positional, // args that are identified by their position rather than a flag. Means the filename can be provided as the first unnamed argument on the CLI.
    cl::desc("<input toy file>"),   // In terminal for --help option, it will show "USAGE: toy-parser-main [options] <input toy file>"
    cl::init("-"),  // sets a default "-" value for inputFileName. If no filename is provided on the CLI, "-" will act as std input. In other words, the dash ("-") conventionally means standard input, so if no file is provided, the program may read from standard input.
    cl::value_desc("filename")
);



/// @brief Read & return the content `*.toy` input code file
/// @param inputFileName "*.toy" input file path. Managed by "static cl::opt<std::string> inputFileName(.....)"
std::unique_ptr<llvm::MemoryBuffer> parseInputFile(llvm::StringRef inputFileName) {
    
    llvm::ErrorOr<std::unique_ptr<llvm::MemoryBuffer>> fileOrErr = llvm::MemoryBuffer::getFileOrSTDIN(inputFileName);
    
    if (std::error_code ec = fileOrErr.getError()) {
        llvm::errs() << "Could not open input file: " << ec.message() << "\n";
        return nullptr;
    }
    
    // "std::move()" transfers the ownership of the "std::unique_ptr<llvm::MemoryBuffer>" to the function "return" WITHOUT MAKING A COPY.
    // Details: Using "std::move(*fileOrErr)"" tells the compiler to treat this reference to "std::unique_ptr<llvm::MemoryBuffer>"" as an "r-value", which allows the "std::unique_ptr" to be MOVED rather than COPIED.
    return std::move(*fileOrErr);
}



/// @brief Dump the input code in terminal (only for test)
/// @param inputCodeContent Pointer to the code file i.e. living in llvm::MemoryBuffer
void dumpInputCodeFile(std::unique_ptr<llvm::MemoryBuffer> &inputCodeContent) {
    
    llvm::outs() << inputCodeContent->getBuffer() << "\n";
    
    // (Optional): method if you need to flush the stream.
    // You can remove this line if you want.
    llvm::outs().flush();
}



int main(int argc, char **argv) {


    // Config the CLI args & flags with LLVM
    cl::ParseCommandLineOptions(argc, argv, "toy compiler\n");


    // You can use "auto" or "std::unique_ptr<llvm::MemoryBuffer>"
    // auto inputCodeFile = parseInputFile(inputFileName);
    std::unique_ptr<llvm::MemoryBuffer> inputCodeFile = parseInputFile(inputFileName);


    // Dump the input code in terminal
    dumpInputCodeFile(inputCodeFile);


    return 0;
}