#!/bin/bash
pushd .
cd ~/bin/shell_scripts

echo "pushing repsys"
./endday_repsys.sh

echo "pushing liokr"
./endday_liokr.sh

echo "pushing biokr"
./endday_biokr.sh

popd