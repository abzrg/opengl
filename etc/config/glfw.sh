#!/bin/sh -e

# Specify the type of glfw build
export EXTERNAL_GLFW_URL="https://github.com/glfw/glfw/releases/download/3.3.9/glfw-3.3.9.zip"
export EXTERNAL_GLFW_BUILD_TYPE="Shared"        # Shared, Static
if [ ${EXTERNAL_GLFW_BUILD_TYPE} = "Shared" ]; then
    export EXTERNAL_GLFW_BUILD_SHARED_LIBS="ON"
elif [ ${EXTERNAL_GLFW_BUILD_TYPE} = "Static" ]; then
    export EXTERNAL_GLFW_BUILD_SHARED_LIBS="OFF"
else
    echo "Invalid Value for the environment variable EXTERNAL_GLFW_BUILD_TYPE."
    echo "Valid values are: Shared, Static"
fi
export EXTERNAL_GLFW_INSTALL="ON"
export EXTERNAL_GLFW_BUILD_EXAMPLES="OFF"
export EXTERNAL_GLFW_BUILD_TESTS="OFF"
export EXTERNAL_GLFW_BUILD_DOCS="OFF"

# Specify the GLFW path for pkg-config
export PKG_CONFIG_PATH="${EXTERNAL_INST_DIR}/lib/pkgconfig:${PKG_CONFIG_PATH}"

# In case of shared library
if [ "${EXTERNAL_GLFW_BUILD_TYPE}" = "Shared" ]; then
    if [ `uname -s` = "Darwin" ]; then
        export DYLD_LIBRARY_PATH="${EXTERNAL_INST_DIR}/lib"
    elif [ `uname -s` = "Linux" ]; then
        export LD_LIBRARY_PATH="${EXTERNAL_INST_DIR}/lib"
    fi
fi
