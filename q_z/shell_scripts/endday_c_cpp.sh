#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/c_cpp
echo "commit c_cpp changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

popd