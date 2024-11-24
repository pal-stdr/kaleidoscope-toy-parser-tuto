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

LDFLAGS=""




# Compile command
COMPILE_CMD="g++  \
    ${CC}   \
    ${CFLAGS}   \
    ${APP_ROOT_DIR}/${APP_MAIN_SRC_FILE}    \
    ${LDFLAGS}    \
    -o ${BUILD_DIR}/${APP_BIN_NAME}"


# Display the command with printf
printf "%s\n" "${COMPILE_CMD}"


# Create, change to build dir
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"


# Compile
eval ${COMPILE_CMD}


# Run
"${BUILD_DIR}/${APP_BIN_NAME}"


# # Remove
# rm "${BUILD_DIR}/${APP_BIN_NAME}"