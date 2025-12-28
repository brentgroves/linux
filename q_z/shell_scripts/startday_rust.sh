#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling rust"
cd ~/src/rust
git pull --recurse-submodules

popd