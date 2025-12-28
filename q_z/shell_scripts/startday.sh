#!/bin/bash
pushd .

cd ~/bin/shell_scripts

echo "pulling repsys"
./startday_repsys.sh

echo "pulling gitlab"
./startday_gitlab.sh

echo "pulling k8s"
./startday_k8s.sh

echo "pulling research"
./startday_research.sh

echo "pulling linux"
./startday_linux.sh

echo "pulling iokr"
./startday_iokr.sh

echo "pulling liokr"
./startday_liokr.sh

echo "pulling biokr"
./startday_biokr.sh

echo "pulling go"
./startday_go.sh

echo "pulling python"
./startday_python.sh

echo "pulling rust"
./startday_rust.sh

echo "pulling node"
./startday_node.sh

popd