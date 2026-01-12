#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

cd ~/src
rm -rf ~/src/news
git clone --recursive git@bitbucket.org-brent_admin:linamar_structures/news.git

cd ~/src/news
git add -A
git commit -m "Freshstart commit"
git push -u origin main

popd
