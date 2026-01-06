#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling iokr_guide"
cd ~/src/iokr/inititives/inititive_50/publishing_guide
git pull

echo "pulling iokr"
cd ~/src/iokr
git pull --recurse-submodules

popd