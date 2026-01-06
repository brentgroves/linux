#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/iokr
git clone --recursive git@bitbucket.org-brent_admin:linamar_structures/iokr.git

## git switch main if detached head
cd ~/src/iokr/inititives/inititive_60/iokr_guide
git switch main

## git switch main if detached head
cd ~/src/iokr/inititives/inititive_50/publishing_guide
git switch main

cd ~/src/iokr
git add -A
git commit -m "Freshstart commit"
git push -u origin main

popd
