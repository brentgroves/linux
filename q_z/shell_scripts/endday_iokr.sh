#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_10
echo "commit iokr_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr
echo "commit iokr changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

popd