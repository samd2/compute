#!/bin/bash

if [ "$DRONE_JOB_UUID" = "b6589fc6ab" ] || [ "$DRONE_JOB_UUID" = "356a192b79" ] || [ "$DRONE_JOB_UUID" = "da4b9237ba" ] || [ "$DRONE_JOB_UUID" = "77de68daec" ] || [ "$DRONE_JOB_UUID" = "1b64538924" ] || [ "$DRONE_JOB_UUID" = "ac3478d69a" ] || [ "$DRONE_JOB_UUID" = "c1dfd96eea" ] || [ "$DRONE_JOB_UUID" = "902ba3cda1" ] || [ "$DRONE_JOB_UUID" = "fe5dbbcea5" ] || [ "$DRONE_JOB_UUID" = "0ade7c2cf9" ] || [ "$DRONE_JOB_UUID" = "b1d5781111" ] || [ "$DRONE_JOB_UUID" = "17ba079149" ] ; then
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        travis_retry wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      brew update
      /usr/bin/yes | pip uninstall numpy
      brew outdated boost || brew upgrade boost
      brew outdated cmake || brew upgrade cmake
      brew install lcov # homebrew/science/opencv
    fi

    gem install coveralls-lcov
    ${CXX} --version
    if [ "$CXX" = "g++" ]; then export CXX="g++-${GCC_VERSION}" CC="gcc-${GCC_VERSION}"; fi
    ${CXX} --version
    export CMAKE_OPTIONS=${CMAKE_OPTIONS}" "${ENV_CMAKE_OPTIONS}
    export CXX_FLAGS=${CXX_FLAGS}" "${ENV_CXX_FLAGS}
    wget http://downloads.sourceforge.net/ltp/lcov-1.14.tar.gz
    tar -xvf lcov-1.14.tar.gz
    cd lcov-1.14
    make install && cd ..
fi
if [ "$DRONE_JOB_UUID" = "7b52009b64" ] || [ "$DRONE_JOB_UUID" = "bd307a3ec3" ] || [ "$DRONE_JOB_UUID" = "fa35e19212" ] ; then
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        travis_retry wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      brew update
      /usr/bin/yes | pip uninstall numpy
      brew outdated boost || brew upgrade boost
      brew outdated cmake || brew upgrade cmake
      brew install lcov # homebrew/science/opencv
    fi

    gem install coveralls-lcov
    ${CXX} --version
    if [ "$CXX" = "g++" ]; then export CXX="g++-${GCC_VERSION}" CC="gcc-${GCC_VERSION}"; fi
    ${CXX} --version
    export CMAKE_OPTIONS=${CMAKE_OPTIONS}" "${ENV_CMAKE_OPTIONS}
    export CXX_FLAGS=${CXX_FLAGS}" "${ENV_CXX_FLAGS}
fi

