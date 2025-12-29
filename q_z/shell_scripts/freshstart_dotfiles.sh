#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

rm -rf ~/dotfiles
cd ~
git clone --recursive git@github.com:brentgroves/dotfiles.git

popd
