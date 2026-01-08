#!/bin/bash
# run: bash deploy_scripts.sh // if you don't zsh will run and it ignores rm -f
# https://gist.github.com/gitaarik/8735255
# https://linuxsimply.com/bash-scripting-tutorial/conditional-statements/if-else/rm-if-exists/#:~:text=To%20delete%20a%20file%20by,along%20with%20the%20rm%20command.
pushd .
rm -f ~/bin/shell_scripts/scc.sh 
rm -f ~/bin/shell_scripts/cp_*.sh
rm -f ~/bin/shell_scripts/*seagate.sh
rm -f ~/bin/shell_scripts/*_dotfiles.sh 
rm -f ~/bin/shell_scripts/freshstart.sh 
rm -f ~/bin/shell_scripts/startday.sh 
rm -f ~/bin/shell_scripts/endday.sh 
rm -f ~/bin/shell_scripts/*_repsys.sh 
rm -f ~/bin/shell_scripts/*_gitlab.sh
rm -f ~/bin/shell_scripts/*_k8s.sh 
rm -f ~/bin/shell_scripts/*_research.sh 
rm -f ~/bin/shell_scripts/*_linux.sh 
rm -f ~/bin/shell_scripts/*_iokr.sh 
rm -f ~/bin/shell_scripts/*_liokr.sh
rm -f ~/bin/shell_scripts/*_go.sh 
rm -f ~/bin/shell_scripts/*_rust.sh 
rm -f ~/bin/shell_scripts/*_python.sh 
rm -f ~/bin/shell_scripts/*_node.sh 
rm -f ~/bin/shell_scripts/*_wasm.sh 
rm -f ~/bin/shell_scripts/*_c_cpp.sh 
rm -f ~/bin/shell_scripts/*multimedia.sh

cp ~/src/linux/q_z/shell_scripts/scc.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/cp_*.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*seagate.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_dotfiles.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/freshstart.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/startday.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/endday.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_repsys.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_gitlab.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_k8s.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_research.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/cp_*.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_linux.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_iokr.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_liokr.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_go.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_rust.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_python.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_node.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_wasm.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_c_cpp.sh ~/bin/shell_scripts/
cp ~/src/linux/q_z/shell_scripts/*_multimedia.sh ~/bin/shell_scripts/

popd
