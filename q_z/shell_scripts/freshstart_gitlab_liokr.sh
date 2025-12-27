#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .
# rm -rf ~/dotfiles
# cd ~
# git clone https://github.com/brentgroves/dotfiles.git
cd ~/gitlab
rm -rf ~/gitlab/liokr
git clone --recursive git@gitlab.com-linamar:brent.groves/liokr.git

## git switch main if detached head
cd ~/gitlab/liokr/linux
git switch main

cd ~/gitlab/liokr
git add -A
git commit -m "Freshstart commit"
git push -u origin main

popd
