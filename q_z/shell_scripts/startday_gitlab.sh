#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

# --recurse-submodules don't seem to always pull all the commits

echo "pulling gitlab"
cd ~/src/gitlab
git pull --recurse-submodules

popd