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

## install prereqs and basic packages

```bash
# you may have to reinstall curl
sudo snap remove curl
sudo apt install curl
sudo apt install build-essential libnss3-tools
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
- **[soapui](../q_z/soapui/soapui_install.md)**
- **[meld](../k_p/meld/meld_install.md)**
- **[ghex](../e_j/ghex/ghex_install.md)**
- **[postman](../k_p/postman/postman.md)**
<!-- gnome system monitor - System monitor was already installed on ubuntu 22.04 -->
<!-- teams standalone app not supported in Linux use web app teams.microsoft.com/v2 instead  -->
- **[docker](../a_d/docker/install.md)**
- **[microk8s](../../k8s/microk8s_1.28_install.md)**
- **[kubectl](../../k8s/kubectl-install.md)**
- **[mysql client](../k_p/mysql/mysql-client.md)**
- **[mysql shell](../k_p/mysql/mysql-shell.md)**
- **[java](../e_j/java/java.md)**
- **[ant](../a_d/ant/ant.md)**
- **[Free Pascal](../k_p/pascal/free_pascal-install.md)**
- **[utils](../q_z/utils/utils-install.md)**
- **[mongosh](../k_p/mongosh/install-mongosh.md)**
- **[studio-3t](../q_z/studio-3t/studio-3t-intall.md)**
- **[azure_cli](../a_d/azure/azure_cli.md)**
