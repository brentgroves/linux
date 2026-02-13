#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

echo "pulling iokr_guide"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_10/iokr_guide
git pull

echo "pulling publishing_guide"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_20/publishing_guide
git pull

echo "pulling okrs"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_30/okrs
git pull

echo "pulling dimcol"
cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/initiatives/init_10/dimcol
git pull

echo "pulling procap"
cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/initiatives/init_20/procap
git pull

echo "pulling feedback"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_40/feedback
git pull

echo "pulling fabric"
cd ~/src/iokr/teams/team_30/goals/goal_10/key_results/kr_10/initiatives/init_10/fabric_guide
git pull

echo "pulling powerbi_guide"
cd ~/src/iokr/teams/team_40/goals/goal_10/key_results/kr_10/initiatives/init_10/powerbi_guide
git pull

echo "pulling github"
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_50/github
git pull

echo "pulling oil_consumption"
cd ~/src/iokr/teams/team_140/goals/goal_10/key_results/kr_10/initiatives/init_10/oil_consumption
git pull

echo "pulling microcloud"
cd ~/src/iokr/teams/team_60/goals/goal_10/key_results/kr_10/initiatives/init_10/microcloud
git pull

echo "pulling plex_labels"
cd ~/src/iokr/teams/team_110/goals/goal_10/key_results/kr_10/initiatives/init_10/plex_labels
git pull

echo "pulling kubernetes"
cd ~/src/iokr/teams/team_70/goals/goal_10/key_results/kr_10/initiatives/init_10/kubernetes
git pull

echo "pulling autoetl"
cd ~/src/iokr/teams/team_80/goals/goal_10/key_results/kr_10/initiatives/init_10/autoetl
git pull

echo "pulling eng_tracking"
cd ~/src/iokr/teams/team_150/goals/goal_10/key_results/kr_10/initiatives/init_10/eng_tracking
git pull

echo "pulling xray_audits"
cd ~/src/iokr/teams/team_170/goals/goal_10/key_results/kr_10/initiatives/init_10/xray_audits
git pull

echo "pulling iokr"
cd ~/src/iokr
git pull --recurse-submodules

popd