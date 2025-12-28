#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling node"
cd ~/src/node
git pull --recurse-submodules

popd