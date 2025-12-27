#!/bin/bash
pushd .
cd ~/bin/shell_scripts

echo "pulling repsys"
./startday_repsys.sh

echo "pushing repsys"
./endday_repsys.sh

echo "pulling liokr"
./startday_liokr.sh

echo "pushing liokr"
./endday_liokr.sh

echo "pulling biokr"
./startday_biokr.sh

echo "pushing biokr"
./endday_biokr.sh

echo "pulling gitlab liokr"
./startday_gitlab_liokr.sh

echo "pushing gitlab liokr"
./endday_gitlab_liokr.sh
popd