# Desktop install process

## Update apt packages

```bash

sudo apt update -yq | sudo apt upgrade -yq
install xrdp
```

## Mount USB on local system

```bash
ls /media/brent/KINGSTON/computers_vms/

```

## Update Network Settings

```bash
vi /media/brent/KINGSTON/computers_vms/repsys12.md
```

## install some packages

```bash
# you may have to reinstall curl
sudo snap remove curl
sudo apt install curl
sudo apt install build-essential
```

## install applications

- **[chrome](../chrome/install.md)**
- **[git](../git/git.md)**
<!-- **[pass](../pass/pass.md)**  -->
- **[code](../code/code.md)**
- **[hosts](../hosts/hosts.md)**
- **[screen](../screen/install-screen.md)**
- **[ftp server](../ftp/ftp-server.md)**
- **[ftp client](../ftp/ftp-client.md)**
- **[miniconda](../conda/miniconda-install.md)**
- **[neofetch](../neofetch/install-neofetch.md)**
- **[homebrew](../homebrew/homebrew-install.md)** for k9s because its snap dont work and it is in the .zshrc file
- **[dotfiles](../dotfiles/install-dotfiles.md)**
- **[nvm](../nvm/install-node-version-manager.md)**
- **[neovim](../neovim/install-neovim.md)**
- **[tmux](../tmux/tmux.md)**
- **[remmina](../remmina/install.md)**
<!-- cron -- this is already installed on ubuntu 22.04 -->
<!-- email - check in reports docker file was part of pipeline  -->
- **[ksh](../ksh/ksh.md)**
- **[odbc](../odbc/install-ubuntu.md)**
<!-- # I don't think I need an older version for because I don't install a local version of mongodb and conda can install an older ssl if needed for pysoap -->
<!-- ssl -- older ssl for mongodb and pysoap. -->
<!-- openssl -->
- **[ssh](../ssh/ssh.md)**
- **[mysql client](../mysql/mysql-client.md)
mkdir -p ~/backups/db
dbeaver
soapui
meld
ghex
postman
gnome system monitor - System monitor was already installed on ubuntu 22.04
<!-- teams  -->
docker
sudo apt install libnss3-tools
microk8s
kubectl
deploy mysql
restore mysql database from most recent backup
java
ant
utils
mongosh
studio-3t
azure_cli
