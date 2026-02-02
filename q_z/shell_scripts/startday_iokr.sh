#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling iokr_guide"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_10/iokr_guide
git pull

echo "pulling publishing_guide"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_20/publishing_guide
git pull

echo "pulling okrs"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_30/okrs
git pull

echo "pulling dimcol"
cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/inititives/init_10/dimcol
git pull

echo "pulling procap"
cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/inititives/init_20/procap
git pull

echo "pulling feedback"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_40/feedback
git pull

echo "pulling fabric"
cd ~/src/iokr/teams/team_30/goals/goal_10/key_results/kr_10/inititives/init_10/fabric_guide
git pull

echo "pulling powerbi_guide"
cd ~/src/iokr/teams/team_40/goals/goal_10/key_results/kr_10/inititives/init_10/powerbi_guide
git pull

echo "pulling github"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_50/github
git pull

echo "pulling oil_consumption"
cd ~/src/iokr/teams/team_30/goals/goal_10/key_results/kr_10/inititives/init_20/oil_consumption
git pull

echo "pulling iokr"
cd ~/src/iokr
git pull --recurse-submodules

popd