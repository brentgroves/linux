#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/iokr/inititives/inititive_90/okrs
git switch main
echo "commit okrs changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/inititives/inititive_60/iokr_guide
git switch main
echo "commit iokr_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/inititives/inititive_50/publishing_guide
git switch main
echo "commit publishing_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr
git switch main
echo "commit iokr changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

popd