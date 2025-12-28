#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling python"
cd ~/src/python
git pull --recurse-submodules

popd