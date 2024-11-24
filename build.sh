# ========== LLVM SETUP ==========

PROJECT_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# LLVM_PROJECT_ROOT="${PROJECT_ROOT_DIR}/llvm-19-src"
# LLVM_PROJECT_ROOT="${MY_EXTERNAL_SDD_WORK_DIR}/compiler-projects/llvm-18-src-build"

LLVM_PROJECT_BUILD_DIR="${PROJECT_ROOT_DIR}/llvm-19-src-build"
LLVM_PROJECT_INSTALLATION_DIR="${PROJECT_ROOT_DIR}/llvm-19-src-build-installation"

LLVM_PROJECT_INCLUDE_DIR="${LLVM_PROJECT_INSTALLATION_DIR}/include"
LLVM_PROJECT_LIB_DIR="${LLVM_PROJECT_INSTALLATION_DIR}/lib"
LLVM_PROJECT_BIN_DIR="${LLVM_PROJECT_BUILD_DIR}/bin"

# Load the libs in ENV as LINKER PATH
export LD_LIBRARY_PATH="${LLVM_PROJECT_LIB_DIR}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"


CLANG_PLUS_BIN="${LLVM_PROJECT_BIN_DIR}/clang++"
LLVM_CONFIG_BIN="${LLVM_PROJECT_BIN_DIR}/llvm-config"


# (Optional) Following "llvm-config" cmd prints
# eval "${LLVM_CONFIG_BIN} --cxxflags --ldflags --system-libs --libs all"
# Returns
# -I/path/to/kelaidoscope-toy-tuto/llvm-19-src-build-installation/include -std=c++17   -fno-exceptions -funwind-tables -fno-rtti -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
# -L/path/to/kelaidoscope-toy-tuto/llvm-19-src-build-installation/lib 
# -lLLVMWindowsManifest -lLLVMXRay -lLLVMLibDriver -lLLVMDlltoolDriver -lLLVMTextAPIBinaryReader -lLLVMCoverage -lLLVMLineEditor -lLLVMSandboxIR -lLLVMX86TargetMCA -lLLVMX86Disassembler -lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMX86Desc -lLLVMX86Info -lLLVMOrcDebugging -lLLVMOrcJIT -lLLVMWindowsDriver -lLLVMMCJIT -lLLVMJITLink -lLLVMInterpreter -lLLVMExecutionEngine -lLLVMRuntimeDyld -lLLVMOrcTargetProcess -lLLVMOrcShared -lLLVMDWP -lLLVMDebugInfoLogicalView -lLLVMDebugInfoGSYM -lLLVMOption -lLLVMObjectYAML -lLLVMObjCopy -lLLVMMCA -lLLVMMCDisassembler -lLLVMLTO -lLLVMPasses -lLLVMHipStdPar -lLLVMCFGuard -lLLVMCoroutines -lLLVMipo -lLLVMVectorize -lLLVMLinker -lLLVMInstrumentation -lLLVMFrontendOpenMP -lLLVMFrontendOffloading -lLLVMFrontendOpenACC -lLLVMFrontendHLSL -lLLVMFrontendDriver -lLLVMExtensions -lLLVMDWARFLinkerParallel -lLLVMDWARFLinkerClassic -lLLVMDWARFLinker -lLLVMCodeGenData -lLLVMGlobalISel -lLLVMMIRParser -lLLVMAsmPrinter -lLLVMSelectionDAG -lLLVMCodeGen -lLLVMTarget -lLLVMObjCARCOpts -lLLVMCodeGenTypes -lLLVMIRPrinter -lLLVMInterfaceStub -lLLVMFileCheck -lLLVMFuzzMutate -lLLVMScalarOpts -lLLVMInstCombine -lLLVMAggressiveInstCombine -lLLVMTransformUtils -lLLVMBitWriter -lLLVMAnalysis -lLLVMProfileData -lLLVMSymbolize -lLLVMDebugInfoBTF -lLLVMDebugInfoPDB -lLLVMDebugInfoMSF -lLLVMDebugInfoDWARF -lLLVMObject -lLLVMTextAPI -lLLVMMCParser -lLLVMIRReader -lLLVMAsmParser -lLLVMMC -lLLVMDebugInfoCodeView -lLLVMBitReader -lLLVMFuzzerCLI -lLLVMCore -lLLVMRemarks -lLLVMBitstreamReader -lLLVMBinaryFormat -lLLVMTargetParser -lLLVMTableGen -lLLVMSupport -lLLVMDemangle
# -lrt -ldl -lpthread -lm -lz



# ========== App core config ==========

PROJECT_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
APP_ROOT_DIR="${PROJECT_ROOT_DIR}/src"
APP_INCLUDE_DIR="${APP_ROOT_DIR}/include"
APP_MAIN_SRC_FILE="kaleidoscope-parser-main.cpp"
APP_BIN_NAME="kaleidoscope-parser"



# Build settings
BUILD_DIR="${PROJECT_ROOT_DIR}/build"




# Compile config
# For c++17, "-std=gnu++1z"
# For c++20, use ‘-std=c++2a’ or ‘-std=gnu++2a’
# CC="-std=gnu++1z"
CC="-g -std=c++2a"

# declare Include paths
CFLAGS="-I ${APP_INCLUDE_DIR} -I ${APP_ROOT_DIR}"

# Enable all kind of warnings
CFLAGS+=" -Wall -Wextra -pedantic"


# LLVMFLAGS="$(llvm-config --cxxflags --ldflags --system-libs --libs all)"
# Collects the lib lookup path (i.e. "-L /path/to/lib"), linker flags (e.g. "-lLLVMWindowsManifest" "-lLLVMXRay" "-lLLVMLibDriver" etc. tons more.)
LLVMFLAGS="$(${LLVM_CONFIG_BIN} --cxxflags --ldflags --system-libs --libs)"

LDFLAGS+=${LLVMFLAGS}




# Compile command
COMPILE_CMD="${CLANG_PLUS_BIN}  \
    ${CC}   \
    ${CFLAGS}   \
    ${APP_ROOT_DIR}/${APP_MAIN_SRC_FILE}    \
    ${LDFLAGS}    \
    -o ${BUILD_DIR}/${APP_BIN_NAME}"


# # Display the command with printf
# printf "%s\n" "${COMPILE_CMD}"


# Create, change to build dir
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"


# Compile
eval ${COMPILE_CMD}


# Run
"${BUILD_DIR}/${APP_BIN_NAME}"


# # Remove
# rm "${BUILD_DIR}/${APP_BIN_NAME}"