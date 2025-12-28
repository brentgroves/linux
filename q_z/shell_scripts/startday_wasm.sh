#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling wasm"
cd ~/src/wasm
git pull --recurse-submodules

popd