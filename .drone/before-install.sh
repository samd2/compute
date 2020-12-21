#!/bin/bash

if [ "$DRONE_JOB_UUID" = "b6589fc6ab" ] || [ "$DRONE_JOB_UUID" = "356a192b79" ] || [ "$DRONE_JOB_UUID" = "da4b9237ba" ] || [ "$DRONE_JOB_UUID" = "77de68daec" ] || [ "$DRONE_JOB_UUID" = "1b64538924" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    export ENV_CMAKE_OPTIONS="-DOpenCL_LIBRARY=${POCL_OPENCL_LIB} -DOpenCL_INCLUDE_DIR=${OPENCL_ROOT}/include"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
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
if [ "$DRONE_JOB_UUID" = "ac3478d69a" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    export ENV_CMAKE_OPTIONS="-DOpenCL_LIBRARY=${POCL_OPENCL_LIB} -DOpenCL_INCLUDE_DIR=${OPENCL_ROOT}/include -DBOOST_COMPUTE_ENABLE_COVERAGE=ON"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
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
if [ "$DRONE_JOB_UUID" = "c1dfd96eea" ] || [ "$DRONE_JOB_UUID" = "902ba3cda1" ] || [ "$DRONE_JOB_UUID" = "fe5dbbcea5" ] || [ "$DRONE_JOB_UUID" = "0ade7c2cf9" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    export ENV_CMAKE_OPTIONS="-DOpenCL_INCLUDE_DIR=${OPENCL_ROOT}/include"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
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
if [ "$DRONE_JOB_UUID" = "b1d5781111" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    export ENV_CMAKE_OPTIONS="-DOpenCL_INCLUDE_DIR=${OPENCL_ROOT}/include -DBOOST_COMPUTE_USE_CPP11=ON"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
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
if [ "$DRONE_JOB_UUID" = "17ba079149" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    export ENV_CMAKE_OPTIONS="-DOpenCL_INCLUDE_DIR=${OPENCL_ROOT}/include -DBOOST_COMPUTE_ENABLE_COVERAGE=ON -DBOOST_COMPUTE_USE_CPP11=ON"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
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
if [ "$DRONE_JOB_UUID" = "7b52009b64" ] || [ "$DRONE_JOB_UUID" = "bd307a3ec3" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    export ENV_CMAKE_OPTIONS="-DOpenCL_LIBRARY=${OPENCL_ICD_LIB} -DOpenCL_INCLUDE_DIR=${OPENCL_ROOT}/include -DBOOST_COMPUTE_USE_CPP11=ON"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
    fi

    gem install coveralls-lcov
    ${CXX} --version
    if [ "$CXX" = "g++" ]; then export CXX="g++-${GCC_VERSION}" CC="gcc-${GCC_VERSION}"; fi
    ${CXX} --version
    export CMAKE_OPTIONS=${CMAKE_OPTIONS}" "${ENV_CMAKE_OPTIONS}
    export CXX_FLAGS=${CXX_FLAGS}" "${ENV_CXX_FLAGS}
fi
if [ "$DRONE_JOB_UUID" = "fa35e19212" ] ; then
    export DEPS_DIR="${TRAVIS_BUILD_DIR}/deps"
    export OPENCL_ROOT="${DEPS_DIR}/opencl"
    export OPENCL_ICD_LIB="${OPENCL_ROOT}/icd/build/lib/libOpenCL.so"
    export POCL_ROOT="${OPENCL_ROOT}/pocl-${POCL_BRANCH}/"
    export POCL_LLVM_CONFIG="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/llvm-config"
    export POCL_CXX_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang++"
    export POCL_C_COMPILER="${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}/bin/clang"
    export POCL_OPENCL_LIB="${POCL_ROOT}/lib/libOpenCL.so"
    # POCL dependencies for Xenial
    if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
      if [ -z "$(ls -A ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION})" ]; then
        POCL_LLVM_URL=http://llvm.org/releases/${POCL_LLVM_VERSION}/clang+llvm-${POCL_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz
        mkdir -p ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION}
        wget --no-check-certificate --quiet -O llvm-${POCL_LLVM_VERSION}.tar.xz ${POCL_LLVM_URL}
        tar xf llvm-${POCL_LLVM_VERSION}.tar.xz -C ${DEPS_DIR}/llvm-${POCL_LLVM_VERSION} --strip-components 1
      else
        echo 'Using cached LLVM.'
      fi
    # OSX
    elif [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
      true brew update
      /usr/bin/yes | true pip uninstall numpy
      true brew outdated boost || true brew upgrade boost
      true brew outdated cmake || true brew upgrade cmake
      true brew install lcov # homebrew/science/opencv
    fi

    gem install coveralls-lcov
    ${CXX} --version
    if [ "$CXX" = "g++" ]; then export CXX="g++-${GCC_VERSION}" CC="gcc-${GCC_VERSION}"; fi
    ${CXX} --version
    export CMAKE_OPTIONS=${CMAKE_OPTIONS}" "${ENV_CMAKE_OPTIONS}
    export CXX_FLAGS=${CXX_FLAGS}" "${ENV_CXX_FLAGS}
fi

