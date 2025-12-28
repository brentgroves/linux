#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/wasm
git clone --recursive git@github.com:brentgroves/wasm.git

popd
