#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/iokr
git clone --recursive git@github.com:brentgroves/iokr.git

popd
