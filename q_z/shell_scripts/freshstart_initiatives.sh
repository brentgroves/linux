#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/initiatives
git clone --recursive git@bitbucket.org-brent_admin:liokr/initiatives.git

cd ~/src/initiatives/xray_audits
git switch main

cd ~/src/initiatives/fabric_guide
git switch main

popd
