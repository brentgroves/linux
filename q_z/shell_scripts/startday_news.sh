#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling news"
cd ~/src/news
git pull --recurse-submodules

popd