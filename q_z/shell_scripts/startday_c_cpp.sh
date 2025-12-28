#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling c_cpp"
cd ~/src/c_cpp
git pull --recurse-submodules

popd