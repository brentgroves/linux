#!/bin/bash
# https://gist.github.com/gitaarik/8735255
pushd .

rm -rf ~/src/odbc
cp -r "/media/brent/Seagate Expansion Drive/odbc" ~/src

rm -rf ~/src/azure
cp -r "/media/brent/Seagate Expansion Drive/azure" ~/src

rm -rf ~/src/secrets
cp -r "/media/brent/Seagate Expansion Drive/secrets" ~/src

rm -rf ~/src/backups
cp -r "/media/brent/Seagate Expansion Drive/backups" ~/src

rm -rf ~/src/pki
cp -r "/media/brent/Seagate Expansion Drive/pki" ~/src

rm -rf ~/src/manuals
cp -r "/media/brent/Seagate Expansion Drive/manuals" ~/src

popd
