#!/bin/bash
pushd .

cd ~/bin/shell_scripts

echo "pulling repsys"
./startday_repsys.sh

echo "pulling liokr"
./startday_liokr.sh

echo "pulling biokr"
./startday_biokr.sh

popd