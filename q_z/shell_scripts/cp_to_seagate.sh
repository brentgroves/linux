#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

rm -rf "/media/brent/Seagate Expansion Drive/odbc" 
cp -r  ~/src/odbc "/media/brent/Seagate Expansion Drive/"

rm -rf "/media/brent/Seagate Expansion Drive/azure" 
cp -r  ~/src/azure "/media/brent/Seagate Expansion Drive/"

rm -rf "/media/brent/Seagate Expansion Drive/secrets" 
cp -r  ~/src/secrets "/media/brent/Seagate Expansion Drive/"

rm -rf "/media/brent/Seagate Expansion Drive/backups" 
cp -r ~/src/backups "/media/brent/Seagate Expansion Drive/"

rm -rf "/media/brent/Seagate Expansion Drive/pki"
cp -r ~/src/pki "/media/brent/Seagate Expansion Drive/"

rm -rf "/media/brent/Seagate Expansion Drive/manuals"
cp -r ~/src/manuals "/media/brent/Seagate Expansion Drive/"

popd
