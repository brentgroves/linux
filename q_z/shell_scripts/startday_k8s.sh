#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

# --recurse-submodules don't seem to always pull all the commits

echo "pulling k8s"
cd ~/src/k8s
git pull --recurse-submodules

# echo "pulling linux"
# cd ~/src/repsys/linux
# git pull --recurse-submodules

# cd ~/src/repsys/linux
# git switch main

popd