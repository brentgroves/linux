#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .
# rm -rf ~/dotfiles
# cd ~
# git clone https://github.com/brentgroves/dotfiles.git
cd ~/src
rm -rf ~/src/k8s
git clone --recursive git@github.com:brentgroves/k8s.git

popd
