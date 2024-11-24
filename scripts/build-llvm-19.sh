set -o errexit
set -o pipefail
set -o nounset

echo ""
echo ">>> Build LLVM 19"
echo ""


# The absolute path to the directory of this script.
BUILD_SCRIPT_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

PROJECT_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && cd ../ && pwd )"


# echo "${PROJECT_ROOT_DIR}"


# LLVM-19 src dir
LLVM_19_SRC_DIR="${PROJECT_ROOT_DIR}/llvm-19-src"


# Set llvm-9 build folder name
BUILD_FOLDER_NAME="llvm-19-src-build"
INSTALLATION_FOLDER_NAME="${BUILD_FOLDER_NAME}-installation"

# Set the BUILD_FOLDER_NAME dir to project root
BUILD_FOLDER_DIR="${PROJECT_ROOT_DIR}/${BUILD_FOLDER_NAME}"
INSTALLATION_FOLDER_DIR="${PROJECT_ROOT_DIR}/${INSTALLATION_FOLDER_NAME}"


# Remove the build/ folder if there is any
rm -Rf "${BUILD_FOLDER_DIR}" "${INSTALLATION_FOLDER_DIR}"

# Create the build folders in $PROJECT_ROOT_DIR
mkdir -p "${BUILD_FOLDER_DIR}" "${INSTALLATION_FOLDER_DIR}"

# Change to build dir
cd "${BUILD_FOLDER_DIR}"/

# echo $PWD

cmake   \
    -G Ninja    \
    -S "${LLVM_19_SRC_DIR}/llvm"  \
    -B .    \
    -DCMAKE_BUILD_TYPE=Release      \
    -DCMAKE_INSTALL_PREFIX="${INSTALLATION_FOLDER_DIR}"  \
    -DLLVM_ENABLE_PROJECTS="llvm;mlir;clang;lld" \
    -DLLVM_INSTALL_UTILS=ON \
    -DCMAKE_C_COMPILER=gcc    \
    -DCMAKE_CXX_COMPILER=g++    \
    -DLLVM_TARGETS_TO_BUILD="host"




cmake --build . --target check-mlir
ninja install