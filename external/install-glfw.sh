#!/bin/sh -e
# Run from external directory
cd "${0%/*}" || exit

echo
echo ========================================
date "+%Y-%m-%d %H:%M:%S %z" 2>/dev/null || echo "date is unknown"
echo "Starting compile GLFW ${0##*/}"
echo ========================================
echo


echo
echo "Downloading GLFW..."
echo

curl --continue-at - --location \
     --remote-name --output-dir .compressed --create-dirs \
     ${EXTERNAL_GLFW_URL} 

unzip .compressed/glfw-3*.zip 


echo
echo "Building GLFW..."
echo

cmake \
    -DBUILD_SHARED_LIBS=${EXTERNAL_GLFW_BUILD_SHARED_LIBS} \
    -DGLFW_BUILD_EXAMPLES=${EXTERNAL_GLFW_BUILD_EXAMPLES} \
    -DGLFW_BUILD_TESTS=${EXTERNAL_GLFW_BUILD_TESTS} \
    -DGLFW_BUILD_DOCS=${EXTERNAL_GLFW_BUILD_DOCS} \
    -DGLFW_INSTALL=${EXTERNAL_GLFW_INSTALL} \
    -DCMAKE_INSTALL_PREFIX=${EXTERNAL_INST_DIR} \
    -S glfw-3* -B ${EXTERNAL_BUILD_DIR}/glfw

cmake --build ${EXTERNAL_BUILD_DIR}/glfw


echo
echo "Installing GLFW into ${EXTERNAL_INST_DIR}"
echo

cmake --install ${EXTERNAL_BUILD_DIR}/glfw
