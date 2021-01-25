#!/bin/bash

# Copyright 2020 Rene Rivera, Sam Darwin
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.txt or copy at http://boost.org/LICENSE_1_0.txt)

if [ "$DRONE_JOB_UUID" = "b6589fc6ab" ] || [ "$DRONE_JOB_UUID" = "356a192b79" ] || [ "$DRONE_JOB_UUID" = "da4b9237ba" ] || [ "$DRONE_JOB_UUID" = "77de68daec" ] || [ "$DRONE_JOB_UUID" = "1b64538924" ] || [ "$DRONE_JOB_UUID" = "ac3478d69a" ] || [ "$DRONE_JOB_UUID" = "c1dfd96eea" ] || [ "$DRONE_JOB_UUID" = "902ba3cda1" ] || [ "$DRONE_JOB_UUID" = "fe5dbbcea5" ] || [ "$DRONE_JOB_UUID" = "0ade7c2cf9" ] || [ "$DRONE_JOB_UUID" = "b1d5781111" ] || [ "$DRONE_JOB_UUID" = "17ba079149" ] || [ "$DRONE_JOB_UUID" = "7b52009b64" ] || [ "$DRONE_JOB_UUID" = "bd307a3ec3" ] || [ "$DRONE_JOB_UUID" = "fa35e19212" ] ; then
    if [[ ${COVERAGE} == "true" ]]; then
      lcov --directory test --base-directory ../include/boost/compute/ --capture --output-file coverage.info
      lcov --remove coverage.info '/usr*' '*/test/*' '*/deps/*' -o coverage.info
      cd .. && coveralls-lcov build/coverage.info
    fi
fi

