#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

# --recurse-submodules don't seem to always pull all the commits

echo "pulling research"
cd ~/src/research
git pull --recurse-submodules

popd