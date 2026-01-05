#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling iokr_guide"
cd ~/src/iokr/inititives/inititive_60/iokr_guide
git pull

echo "pulling iokr"
cd ~/src/iokr
git pull --recurse-submodules

popd