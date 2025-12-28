#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/c_cpp
git clone --recursive git@github.com:brentgroves/c_cpp.git

popd
