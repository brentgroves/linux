#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling iokr_guide"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_10
git pull

echo "pulling iokr"
cd ~/src/iokr
git pull --recurse-submodules

popd