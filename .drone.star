# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# Configuration for https://cloud.drone.io/.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.

def main(ctx):
  return [
  linux_cxx("OPENCL_LIB=pocl ENV_CMAKE_OPTIONS=-DOpenCL_L Job 0", "clang++", packages="g++-5 libltdl-dev libhwloc-dev pkg-config libedit-dev libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'pocl', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=100', 'DRONE_JOB_UUID': 'b6589fc6ab'}),
  linux_cxx("OPENCL_LIB=pocl ENV_CMAKE_OPTIONS=-DOpenCL_L Job 1", "g++", packages="g++-5 libltdl-dev libhwloc-dev pkg-config libedit-dev libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'pocl', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=100', 'DRONE_JOB_UUID': '356a192b79'}),
  linux_cxx("OPENCL_LIB=pocl ENV_CMAKE_OPTIONS=-DOpenCL_L Job 2", "clang++", packages="g++-5 libltdl-dev libhwloc-dev pkg-config libedit-dev libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'pocl', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=101', 'DRONE_JOB_UUID': 'da4b9237ba'}),
  linux_cxx("OPENCL_LIB=pocl ENV_CMAKE_OPTIONS=-DOpenCL_L Job 3", "g++", packages="g++-5 libltdl-dev libhwloc-dev pkg-config libedit-dev libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'pocl', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=101', 'DRONE_JOB_UUID': '77de68daec'}),
  linux_cxx("OPENCL_LIB=pocl ENV_CMAKE_OPTIONS=-DOpenCL_L Job 4", "clang++", packages="g++-5 libltdl-dev libhwloc-dev pkg-config libedit-dev libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'pocl', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=102', 'DRONE_JOB_UUID': '1b64538924'}),
  linux_cxx("OPENCL_LIB=pocl ENV_CMAKE_OPTIONS=-DOpenCL_L Job 5", "g++", packages="g++-5 libltdl-dev libhwloc-dev pkg-config libedit-dev libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'pocl', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=102', 'DRONE_JOB_UUID': 'ac3478d69a'}),
  linux_cxx("OPENCL_LIB=intel ENV_CMAKE_OPTIONS=-DOpenCL_ Job 6", "clang++", packages="g++-5 libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'intel', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=102', 'DRONE_JOB_UUID': 'c1dfd96eea'}),
  linux_cxx("OPENCL_LIB=intel ENV_CMAKE_OPTIONS=-DOpenCL_ Job 7", "g++", packages="g++-5 libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'intel', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=102', 'DRONE_JOB_UUID': '902ba3cda1'}),
  linux_cxx("OPENCL_LIB=intel ENV_CMAKE_OPTIONS=-DOpenCL_ Job 8", "clang++", packages="g++-5 libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'intel', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=200', 'DRONE_JOB_UUID': 'fe5dbbcea5'}),
  linux_cxx("OPENCL_LIB=intel ENV_CMAKE_OPTIONS=-DOpenCL_ Job 9", "g++", packages="g++-5 libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'intel', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=200', 'DRONE_JOB_UUID': '0ade7c2cf9'}),
  linux_cxx("OPENCL_LIB=intel BOOST_VERSION=1_67_0 ENV_C Job 10", "clang++", packages="g++-5 python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'intel', 'BOOST_VERSION': '1_67_0', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=201', 'DRONE_JOB_UUID': 'b1d5781111'}),
  linux_cxx("OPENCL_LIB=intel BOOST_VERSION=1_67_0 COVER Job 11", "g++", packages="g++-5 python-yaml libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'intel', 'BOOST_VERSION': '1_67_0', 'COVERAGE': 'true', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=201', 'DRONE_JOB_UUID': '17ba079149'}),
  linux_cxx("OPENCL_LIB=khronos-icd RUN_TESTS=false ENV_CM Job 12", "clang++", packages="g++-5 libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'khronos-icd', 'RUN_TESTS': 'false', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=202', 'DRONE_JOB_UUID': '7b52009b64'}),
  linux_cxx("OPENCL_LIB=khronos-icd RUN_TESTS=false ENV_CM Job 13", "g++", packages="g++-5 libboost-chrono1.58-dev libboost-date-time1.58-dev libboost-test1.58-dev libboost-system1.58-dev libboost-filesystem1.58-dev libboost-timer1.58-dev libboost-program-options1.58-dev libboost-thread1.58-dev libopencv-dev", buildtype="boost", image="cppalliance/droneubuntu1604:1", environment={'OPENCL_LIB': 'khronos-icd', 'RUN_TESTS': 'false', 'ENV_CXX_FLAGS': '-Wno-unused-local-typedef -DBOOST_COMPUTE_MAX_CL_VERSION=202', 'DRONE_JOB_UUID': 'bd307a3ec3'}),
  osx_cxx("ENV_CMAKE_OPTIONS=-DBOOST_COMPUTE_HAVE_OPENC Job 14", "clang++", packages="", buildtype="boost", environment={'ENV_CXX_FLAGS': '-Wno-c99-extensions', 'ENV_CMAKE_OPTIONS': '-DBOOST_COMPUTE_HAVE_OPENCV=OFF', 'DRONE_JOB_OS_NAME': 'osx', 'DRONE_JOB_UUID': 'fa35e19212'}),
  ]

# Generate pipeline for Linux platform compilers.
def linux_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
  environment_global = {
      "TRAVIS_BUILD_DIR": "/drone/src",

      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
      }
  environment_global.update({'CMAKE_URL': 'https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2-Linux-x86_64.tar.gz', 'OPENCL_LIB': 'default', 'OPENCL_REGISTRY': 'https://www.khronos.org/registry/OpenCL/', 'POCL_BRANCH': 'release_1_2', 'POCL_LLVM_VERSION': '7.0.1', 'GCC_VERSION': '5', 'CMAKE_OPTIONS': '-DBOOST_COMPUTE_BUILD_TESTS=ON -DBOOST_COMPUTE_BUILD_EXAMPLES=ON -DBOOST_COMPUTE_BUILD_BENCHMARKS=ON -DBOOST_COMPUTE_USE_OFFLINE_CACHE=ON -DBOOST_COMPUTE_HAVE_OPENCV=ON -DBOOST_COMPUTE_THREAD_SAFE=ON', 'CXX_FLAGS': '-Wall -pedantic -Werror -Wno-variadic-macros -Wno-long-long -Wno-shadow -DCI_BUILD', 'BOOST_VERSION': 'default', 'RUN_TESTS': 'true', 'COVERAGE': 'false'})
  environment_current=environment_global
  environment_current.update(environment)

  return {
    "name": "Linux %s" % name,
    "kind": "pipeline",
    "type": "docker",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "linux",
      "arch": arch
    },
    # Create env vars per generation arguments.
    "environment": environment_current,
    "steps": [
      {
        "name": "Everything",
        "image": image,
        "privileged" : privileged,
        "environment": stepenvironment,
        "commands": [

          "echo '==================================> SETUP'",
          "uname -a",
          # Moved to Docker
          # "apt-get -o Acquire::Retries=3 update && DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata && apt-get -o Acquire::Retries=3 install -y sudo software-properties-common wget curl apt-transport-https git make cmake apt-file sudo unzip libssl-dev build-essential autotools-dev autoconf libc++-helpers automake g++",
          # "for i in {1..3}; do apt-add-repository ppa:git-core/ppa && break || sleep 2; done",
          # "apt-get -o Acquire::Retries=3 update && apt-get -o Acquire::Retries=3 -y install git",
          "echo '==================================> PACKAGES'",
          "./.drone/linux-cxx-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }

def windows_cxx(name, cxx="g++", cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/dronevs2019", buildtype="boost", environment={}, stepenvironment={}, privileged=False):
  environment_global = {
      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
    }
  environment_global.update({'CMAKE_URL': 'https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2-Linux-x86_64.tar.gz', 'OPENCL_LIB': 'default', 'OPENCL_REGISTRY': 'https://www.khronos.org/registry/OpenCL/', 'POCL_BRANCH': 'release_1_2', 'POCL_LLVM_VERSION': '7.0.1', 'GCC_VERSION': '5', 'CMAKE_OPTIONS': '-DBOOST_COMPUTE_BUILD_TESTS=ON -DBOOST_COMPUTE_BUILD_EXAMPLES=ON -DBOOST_COMPUTE_BUILD_BENCHMARKS=ON -DBOOST_COMPUTE_USE_OFFLINE_CACHE=ON -DBOOST_COMPUTE_HAVE_OPENCV=ON -DBOOST_COMPUTE_THREAD_SAFE=ON', 'CXX_FLAGS': '-Wall -pedantic -Werror -Wno-variadic-macros -Wno-long-long -Wno-shadow -DCI_BUILD', 'BOOST_VERSION': 'default', 'RUN_TESTS': 'true', 'COVERAGE': 'false'})
  environment_current=environment_global
  environment_current.update(environment)

  return {
    "name": "Windows %s" % name,
    "kind": "pipeline",
    "type": "docker",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "windows",
      "arch": arch
    },
    # Create env vars per generation arguments.
    "environment": environment_current,
    "steps": [
      {
        "name": "Everything",
        "image": image,
        "privileged": privileged,
        "environment": stepenvironment,
        "commands": [
          "echo '==================================> SETUP'",
          "echo '==================================> PACKAGES'",
          "bash.exe ./.drone/windows-msvc-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "bash.exe ./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }
def osx_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", osx_version="", xcode_version="", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
  environment_global = {
      # "TRAVIS_BUILD_DIR": "/drone/src",
      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
      }
  environment_global.update({'CMAKE_URL': 'https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2-Linux-x86_64.tar.gz', 'OPENCL_LIB': 'default', 'OPENCL_REGISTRY': 'https://www.khronos.org/registry/OpenCL/', 'POCL_BRANCH': 'release_1_2', 'POCL_LLVM_VERSION': '7.0.1', 'GCC_VERSION': '5', 'CMAKE_OPTIONS': '-DBOOST_COMPUTE_BUILD_TESTS=ON -DBOOST_COMPUTE_BUILD_EXAMPLES=ON -DBOOST_COMPUTE_BUILD_BENCHMARKS=ON -DBOOST_COMPUTE_USE_OFFLINE_CACHE=ON -DBOOST_COMPUTE_HAVE_OPENCV=ON -DBOOST_COMPUTE_THREAD_SAFE=ON', 'CXX_FLAGS': '-Wall -pedantic -Werror -Wno-variadic-macros -Wno-long-long -Wno-shadow -DCI_BUILD', 'BOOST_VERSION': 'default', 'RUN_TESTS': 'true', 'COVERAGE': 'false'})
  environment_current=environment_global
  environment_current.update(environment)

  # exec runner only has step-level environment variables:
  environment_step = environment_current
  environment_step.update(stepenvironment)

  if xcode_version:
    environment_step["DEVELOPER_DIR"] = "/Applications/Xcode-" + xcode_version +  ".app/Contents/Developer"
    if not osx_version:
        if xcode_version[0:2] in [ "12","11","10"]:
            osx_version="catalina"
        elif xcode_version[0:1] in [ "9","8","7","6"]:
            osx_version="highsierra"
  else:
    osx_version="catalina"

  return {
    "name": "OSX %s" % name,
    "kind": "pipeline",
    "type": "exec",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "darwin",
      "arch": arch
    },
    "node": {
      "os": osx_version
      },
    "steps": [
      {
        "name": "Everything",
        # "image": image,
        "privileged" : privileged,
        "environment": environment_step,
        "commands": [

          "echo '==================================> SETUP'",
          "uname -a",
          # "apt-get -o Acquire::Retries=3 update && apt-get -o Acquire::Retries=3 -y install git",
          "echo '==================================> PACKAGES'",
          "./.drone/osx-cxx-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }

def freebsd_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
    pass
