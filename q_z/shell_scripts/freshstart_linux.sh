#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/linux
git clone --recursive git@github.com:brentgroves/linux.git

popd
