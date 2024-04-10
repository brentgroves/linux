# **[lftp client](https://linuxopsys.com/topics/lftp-commands)**

## copy shell scripts to server

```bash
# From dev system 
cd ~/src/repsys/shell_scripts
ssh brent@repsys12
chmod 775 ~/bin/shell_scripts/

# upload shell scripts to server
lftp brent@rephub12
:~> cd ~/bin/shell_scripts #this is in dotfiles path
:~> mput *.sh
exit
ssh brent@repsys12
chmod 755 ~/bin/shell_scripts/*

cd ~/src/repsys/k8s/kubectl/all-config-files
# upload kube config files to server .config dir
lftp brent@repsys12
:~> cd .kube
:~> mput *.yaml
exit
```
