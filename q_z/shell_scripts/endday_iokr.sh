#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/iokr/inititives/inititive_90/okrs
echo "commit okrs changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/inititives/inititive_60/iokr_guide
echo "commit iokr_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/inititives/inititive_50/publishing_guide
echo "commit publishing_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr
echo "commit iokr changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

popd