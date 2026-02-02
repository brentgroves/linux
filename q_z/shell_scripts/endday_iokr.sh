#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_30/okrs
git switch main
echo "commit okrs changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_10/iokr_guide
git switch main
echo "commit iokr_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_20/publishing_guide
git switch main
echo "commit publishing_guide changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/inititives/init_10/dimcol
git switch main
echo "commit dimcol changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_50/goals/goal_10/key_results/kr_10/inititives/init_20/procap
git switch main
echo "commit procap changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_40/feedback
git switch main
echo "commit feedback changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_30/goals/goal_10/key_results/kr_10/inititives/init_10/fabric_guide
git switch main
echo "commit feedback changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_20/goals/goal_10/key_results/kr_10/inititives/init_50/github
git switch main
echo "commit github changes"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/iokr/teams/team_30/goals/goal_10/key_results/kr_10/inititives/init_20/oil_consumption
git switch main
echo "commit oil_consumption changes"
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