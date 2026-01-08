#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/biokr
git clone --recursive git clone git@bitbucket.org-brent_admin:linamar_structures/multimedia.git

popd
