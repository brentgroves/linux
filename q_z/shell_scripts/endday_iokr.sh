#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/iokr
echo "commit iokr changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

popd