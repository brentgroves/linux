#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/liokr
git clone --recursive git@bitbucket.org-brent_admin:liokr/liokr.git

popd
