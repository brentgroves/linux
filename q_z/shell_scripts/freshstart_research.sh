#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/research
git clone --recursive git@bitbucket.org:linamar_structures/research.git

popd
