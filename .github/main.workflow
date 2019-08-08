on:
  push:
    branches:
    - master
  pull_request:
    branches:
    - master

jobs:
  build_macos:
    name: Build MacOS
    runs-on: macos-release

    steps:
    - uses: actions/checkout@master
      with:
        fetch-depth: 1

    - name: build pulsar mac libararied
      run: |
        build.sh
