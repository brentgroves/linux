#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling go"
cd ~/src/go
git pull --recurse-submodules

popd