#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/iokr
git clone --recursive git@bitbucket.org-brent_admin:linamar_structures/iokr.git

## git switch main if detached head
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_10/iokr_guide
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_20/publishing_guide
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_30/okrs
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/initiatives/init_10/dimcol
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/initiatives/init_20/procap
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_40/feedback
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_30/goals/goal_10/key_results/kr_10/initiatives/init_10/fabric_guide
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/initiatives/init_50/github
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_140/goals/goal_10/key_results/kr_10/initiatives/init_10/oil_consumption
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_40/goals/goal_10/key_results/kr_10/initiatives/init_10/powerbi_guide
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_60/goals/goal_10/key_results/kr_10/initiatives/init_10/microcloud
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_110/goals/goal_10/key_results/kr_10/initiatives/init_10/plex_labels
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_70/goals/goal_10/key_results/kr_10/initiatives/init_10/kubernetes
git switch main

## git switch main if detached head
cd ~/src/iokr/teams/team_80/goals/goal_10/key_results/kr_10/initiatives/init_10/autoetl
git switch main

cd ~/src/iokr/teams/team_120/goals/goal_10/key_results/kr_10/initiatives/init_10/tms
git switch main

cd ~/src/iokr/teams/team_120/goals/goal_10/key_results/kr_10/initiatives/init_20/tool_management
git switch main

cd ~/src/iokr/teams/team_130/goals/goal_10/key_results/kr_10/initiatives/init_10/plex_fabric
git switch main

# cd ~/src/iokr
# git add -A
# git commit -m "Freshstart commit"
# git push -u origin main

popd
