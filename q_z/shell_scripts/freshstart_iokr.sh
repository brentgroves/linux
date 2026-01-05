#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/iokr
git clone --recursive git@bitbucket.org-brent_admin:linamar_structures/iokr.git

## git switch main if detached head
cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_10/iokr_guide
git switch main

cd ~/src/iokr
git add -A
git commit -m "Freshstart commit"
git push -u origin main

popd
