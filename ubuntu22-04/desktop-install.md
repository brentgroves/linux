# Ubuntu desktop Installation

## **[Create Network Config file](./network_config.md)**

## **[Install Ubuntu Desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop)**

## Update apt packages after OS installation

```bash
sudo apt update -yq | sudo apt upgrade -yq
```

## Connect to new host remotely

- **[Install xrdp server](../q_z/xrdp/xrdp.md)**
- Connect to new host from dev system using remmina
- If not already done update host network setting using its network config file

```bash
# Insert USB drive used for secrets.
code /media/brent/KINGSTON/secrets/hosts/repsys11.md
```

## install basic packages

```bash
# you may have to reinstall curl
sudo snap remove curl
sudo apt install curl
sudo apt install build-essential
```

## **[update with home or work hosts file](../e_j/hosts/)**

## install applications

- **[chrome](../a_d/chrome/install.md)**
- **[git](../e_j/git/git.md)**
<!-- **[pass](../pass/pass.md)**  -->
- **[code](../a_d/code/code.md)**
- **[screen](../q_z/screen/install-screen.md)**
- **[ftp server](../e_j/ftp/ftp-server.md)**
- **[ftp client](../e_j/ftp/ftp-client.md)**
- **[miniconda](../a_d/conda/miniconda-install.md)**
- **[neofetch](../k_p/neofetch/install-neofetch.md)**
- **[homebrew](../e_j/homebrew/homebrew-install.md)** Needed for k9s because its snap dont work.
- **[dotfiles](../a_d/dotfiles/install-dotfiles.md)**
- **[nvm](../k_p/nvm/install-node-version-manager.md)**
- **[neovim](../k_p/neovim/install-neovim.md)**
- **[tmux](../q_z/tmux/tmux.md)**
- **[remmina](../q_z/remmina/install.md)**
<!-- cron -- this is already installed on ubuntu 22.04 -->
<!-- email - check in reports docker file was part of pipeline  -->
- **[ksh](../k_p/ksh/ksh.md)**
- **[odbc](../k_p/odbc/install-ubuntu.md)**
<!-- # I don't think I need an older version for because I don't install a local version of mongodb and conda can install an older ssl if needed for pysoap -->
<!-- ssl -- older ssl for mongodb and pysoap. -->
<!-- openssl -->
- **[ssh](../q_z/ssh/ssh.md)**
- **[mysql client](../k_p/mysql/mysql-client.md)**
- **[dbeaver](../a_d/dbeaver/dbeaver.md)**
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
