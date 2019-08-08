#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

set -e -x

# GIT_REPO=https://github.com/aahmed-se/incubator-pulsar.git
# GIT_TAG=master

GIT_REPO=https://github.com/aahmed-se/pulsar.git
GIT_TAG=py_osx

rm -rf pulsar
git clone -q --depth 1 --branch $GIT_TAG $GIT_REPO pulsar
cd pulsar/pulsar-client-cpp

# brew install wget jq boost-python python@2
# export CMAKE_PREFIX_PATH="/usr/local/opt/zlib"

# # Python 2
# brew unlink python
# brew unlink boost-python3
# brew link --force python@2
# brew link --force boost-python

# cmake . -DBUILD_TESTS=OFF \
# 		-DPYTHON_LIBRARY=/usr/local/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib \
# 		-DPYTHON_INCLUDE_DIR=/usr/local/Frameworks/Python.framework/Versions/2.7/include/python2.7
# make _pulsar -j8
# pushd python
# python2 setup.py bdist_wheel
# popd
# brew unlink python@2
# brew unlink boost-python
# brew link --force boost
# brew link --force python
# brew link --force boost-python3

brew install python cmake openssl zstd boost boost-python3 protobuf zlib

#### Python 3
cmake . -DBUILD_TESTS=OFF \
		-DLINK_STATIC=ON \
		-DPYTHON_LIBRARY=/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7.dylib \
		-DPYTHON_INCLUDE_DIR=/usr/local/Frameworks/Python.framework/Versions/3.7/include/python3.7m
make _pulsar -j8
pushd python
python3 setup.py bdist_wheel
popd

cd ../..
