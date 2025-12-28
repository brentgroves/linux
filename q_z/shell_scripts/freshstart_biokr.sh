#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/biokr
git clone --recursive git@bitbucket.org-brent_groves:biokr/biokr.git

popd
