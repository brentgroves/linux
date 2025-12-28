#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/gitlab
git clone --recursive git@gitlab.com-linamar:brent.groves/gitlab.git

popd
