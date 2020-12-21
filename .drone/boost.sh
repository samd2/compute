#!/bin/bash

set -ex
export TRAVIS_BUILD_DIR=$(pwd)
export TRAVIS_BRANCH=$DRONE_BRANCH
export TRAVIS_OS_NAME=${DRONE_JOB_OS_NAME:-linux}
export VCS_COMMIT_ID=$DRONE_COMMIT
export GIT_COMMIT=$DRONE_COMMIT
export DRONE_CURRENT_BUILD_DIR=$(pwd)
export PATH=~/.local/bin:/usr/local/bin:$PATH

echo '==================================> BEFORE_INSTALL'

. .drone/before-install.sh

echo '==================================> INSTALL'

if [[ ${TRAVIS_OS_NAME} == "linux" ]]; then
  CMAKE_URL=${CMAKE_URL}
  mkdir -p ${DEPS_DIR}/cmake
  wget --no-check-certificate --quiet -O - ${CMAKE_URL} | tar --strip-components=1 -xz -C ${DEPS_DIR}/cmake
  export PATH=${DEPS_DIR}/cmake/bin:${PATH}
fi

if [[ ${TRAVIS_OS_NAME} == "linux" && ${BOOST_VERSION} != "default" ]]; then
  if [ ! -f "${DEPS_DIR}/boost/${BOOST_VERSION}_cached" ]; then
    # Create dirs for source and install
    mkdir -p ${DEPS_DIR}/boost${BOOST_VERSION}
    mkdir -p ${DEPS_DIR}/boost
    rm -rf ${DEPS_DIR}/boost/*
    # Download
    BOOST_BASENAME=$(echo ${BOOST_VERSION} | awk -F '_' '{print $1 "." $2 "." $3 }')
    BOOST_URL="https://dl.bintray.com/boostorg/release/${BOOST_BASENAME}/source/boost_${BOOST_VERSION}.tar.gz"
    wget --no-check-certificate --quiet -O - ${BOOST_URL} | tar --strip-components=1 -xz -C ${DEPS_DIR}/boost${BOOST_VERSION}
    pushd ${DEPS_DIR}/boost${BOOST_VERSION}
    # Configure and install
    if [ "$CXX" = "g++-${GCC_VERSION}" ]; then echo "using gcc : ${GCC_VERSION} : g++-${GCC_VERSION} ;" > $HOME/user-config.jam; fi
    ./bootstrap.sh --prefix=${DEPS_DIR}/boost/ --with-libraries=program_options,filesystem,system,thread,test,timer,chrono
    ./b2 -d0 install
    popd
    rm -rf ${DEPS_DIR}/boost/include/boost/{compute,compute.hpp}
    touch ${DEPS_DIR}/boost/${BOOST_VERSION}_cached
  else
    echo 'Using cached Boost ${BOOST_VERSION} libraries.'
  fi
  export CMAKE_OPTIONS=${CMAKE_OPTIONS}" -DBOOST_ROOT=${DEPS_DIR}/boost"
fi

if [[ ${TRAVIS_OS_NAME} == "linux" ]]; then
  mkdir -p ${OPENCL_ROOT}/include/CL
  pushd ${OPENCL_ROOT}/include/CL
  git clone --depth 1 https://github.com/KhronosGroup/OpenCL-Headers.git
  mv ./OpenCL-Headers/CL/* .
  wget -w 1 -np -nd -nv -A h,hpp --no-check-certificate ${OPENCL_REGISTRY}/api/2.1/cl.hpp;
  popd
fi

if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "khronos-icd" ]]; then
  mkdir -p ${OPENCL_ROOT}
  pushd ${OPENCL_ROOT}
  git clone --depth 1 https://github.com/KhronosGroup/OpenCL-ICD-Loader.git icd
  pushd icd
  mkdir -p inc/CL
  cp -r ${OPENCL_ROOT}/include/CL/* ./inc/CL/
  make -j2
  popd
  popd
fi

if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "pocl" ]]; then
  if [ -z "$(ls -A ${POCL_ROOT}/)" ]; then
    git clone --depth 1 https://github.com/pocl/pocl.git -b ${POCL_BRANCH}
    cd pocl
    mkdir build
    cd build
    cmake -DDIRECT_LINKAGE=ON -DENABLE_ICD=OFF -DCMAKE_C_COMPILER=${POCL_C_COMPILER} -DCMAKE_CXX_COMPILER=${POCL_CXX_COMPILER} -DWITH_LLVM_CONFIG=${POCL_LLVM_CONFIG} -DCMAKE_INSTALL_PREFIX=${POCL_ROOT}/ ..
    make -j2 install
    cd ../..
  else
    echo 'Using cached POCL lib.'
  fi
fi

if [[ ${TRAVIS_OS_NAME} == "linux" && ${OPENCL_LIB} == "intel" ]]; then
  # https://software.intel.com/en-us/articles/opencl-drivers#cpu-section
  PACKAGE_URL=http://registrationcenter-download.intel.com/akdlm/irc_nas/vcp/13793/l_opencl_p_18.1.0.013.tgz
  PACKAGE_NAME=l_opencl_p_18.1.0.013
  wget -q ${PACKAGE_URL} -O /tmp/opencl_runtime.tgz
  tar -xzf /tmp/opencl_runtime.tgz -C /tmp
  sed 's/decline/accept/g' -i /tmp/${PACKAGE_NAME}/silent.cfg
  sudo /tmp/${PACKAGE_NAME}/install.sh -s /tmp/${PACKAGE_NAME}/silent.cfg
fi

echo '==================================> BEFORE_SCRIPT'

. $DRONE_CURRENT_BUILD_DIR/.drone/before-script.sh

echo '==================================> SCRIPT'

mkdir -p build
cd build
echo ${CMAKE_OPTIONS}
echo ${CXX_FLAGS}
cmake ${CMAKE_OPTIONS} -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ..
make -j4
if [[ ${RUN_TESTS} == "true" ]]; then
  # Print OpenCL devices
  ./example/list_devices
  # Run tests and examples
  ctest --output-on-failure --repeat-until-fail 2
fi

echo '==================================> AFTER_SUCCESS'

. $DRONE_CURRENT_BUILD_DIR/.drone/after-success.sh
