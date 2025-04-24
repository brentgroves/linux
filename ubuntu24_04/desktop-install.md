# Install Ubuntu 24.04 Desktop

**[Setup Dev System](../../development/report_system/setup_dev_system/setup_dev_system.md)**\
**[Current Status](../../development/status/weekly/current_status.md)**\
**[Back to Main](../../README.md)**

## **[Create Network Config file](./network_config.md)**

## **[Install Ubuntu Desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop)**

## Update apt packages after OS installation

```bash
sudo apt update -yq | sudo apt upgrade -yq
```

## Copy from Seagate

```bash
mkdir -p ~/src
# copy linux folder to ~/src directory
# download vscode deb file
# right click and install it with software center app.
# open vscode installation markdown in vscode and finish the installation.

```

## Install **[SSH](../q_z/ssh/ssh-server.md)**

## Install **[Gnome Remote Desktop](https://gitlab.gnome.org/GNOME/gnome-remote-desktop)** server

## Connect to new host remotely

```bash
# ssh to new host
ssh brent@repsys13
# xrdp to new host
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

- Update **[/etc/hosts file](../e_j/hosts/)**
- **[chrome](../a_d/chrome/install.md)**
- **[git](../e_j/git/git.md)**
- **[vsftpd server](../q_z/vsftpd/vsftpd-server.md)**
- **[lftp client](../k_p/lftp/lftp_client.md)**
- **[shell scripts](../../volumes/shell_scripts/install_shell_scripts.md)**
<!-- **[pass](../pass/pass.md)**  -->
- **[code](../a_d/code/code.md)**df
- **[screen](../q_z/screen/install-screen.md)**
- **[miniconda](../a_d/conda/miniconda-install.md)**
- **[uv](../k_p/python/uv/uv-install.md)**
- **[neofetch](../k_p/neofetch/install-neofetch.md)**
- **[homebrew](../e_j/homebrew/homebrew-install.md)**
- **[nvm](../k_p/nvm/install-node-version-manager.md)**
- **[dotfiles](../a_d/dotfiles/install-dotfiles.md)**
- **[neovim](../k_p/neovim/install-neovim.md)**
- **[tmux](../q_z/tmux/tmux.md)**
- **[remmina](../q_z/remmina/remmina_install.md)**
<!-- cron -- this is already installed on ubuntu 22.04 -->
<!-- email - check in reports docker file was part of pipeline  -->
- **[ksh](../k_p/ksh/ksh_install.md)**
- **[odbc](../k_p/odbc/install-ubuntu.md)**
<!-- # I don't think I need an older version for because I don't install a local version of mongodb and conda can install an older ssl if needed for pysoap -->
<!-- ssl -- older ssl for mongodb and pysoap. -->
<!-- openssl -->
<!-- - **[ssh client](../q_z/ssh/ssh-client.md)** should already be installed-->

- **[redis client](../q_z/redis/redis_client_install.md)**
- **[mysql client](../k_p/mysql/mysql-client.md)**
- **[mysql shell](../k_p/mysql/mysql-shell.md)**
- **[postgres client](../k_p/postgres/psql/psql-install.md)**
- **[dbeaver](../a_d/dbeaver/dbeaver.md)**
- **[soapui](../q_z/soapui/soapui_install.md)**
- **[meld](../k_p/meld/meld_install.md)**
- **[ghex](../e_j/ghex/ghex_install.md)**
- **[postman](../k_p/postman/postman-install.md)**
<!-- gnome system monitor - System monitor was already installed on ubuntu 22.04 -->
<!-- teams standalone app not supported in Linux use web app teams.microsoft.com/v2 instead  -->
- **[docker](../a_d/docker/install.md)**
- **[microk8s](../../k8s/microk8s_1.28_install.md)**
- **[kubectl](../../k8s/kubectl-install.md)**
- **[java](../e_j/java/java.md)**
- **[ant](../a_d/ant/ant-install.md)**
- **[Free Pascal](../k_p/pascal/free_pascal-install.md)**
- **[utils](../q_z/utils/utils-install.md)**
- **[mongosh](../k_p/mongosh/install-mongosh.md)**
- **[studio-3t](../q_z/studio-3t/studio-3t-intall.md)**
- **[azure_cli](../a_d/azure/azure_cli.md)**
<!-- Only do this if you need to mount old qnap or a Windows drive -->
- **[Mount Windows smb device](../q_z/smb/mount-smb.md)**
