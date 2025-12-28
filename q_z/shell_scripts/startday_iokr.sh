#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling iokr"
cd ~/src/iokr
git pull --recurse-submodules

popd