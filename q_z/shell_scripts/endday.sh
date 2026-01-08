#!/bin/bash
pushd .
cd ~/bin/shell_scripts

echo "pushing repsys"
./endday_repsys.sh

echo "pushing k8s"
./endday_k8s.sh

echo "pushing research"
./endday_research.sh

echo "pushing linux"
./endday_linux.sh

echo "pushing iokr"
./endday_iokr.sh

echo "pushing liokr"
./endday_liokr.sh

echo "pushing go"
./endday_go.sh

echo "pushing rust"
./endday_rust.sh

echo "pushing node"
./endday_node.sh

echo "pushing wasm"
./endday_wasm.sh

echo "pushing c_cpp"
./endday_c_cpp.sh

echo "pushing dotfiles"
./endday_dotfiles.sh

popd