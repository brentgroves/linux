# Install Ubuntu 22.04 Server

- **[Network Config](./network_config.md)**
- **[Install Ubuntu 22.04 server](https://ostechnix.com/install-ubuntu-server/)**
  - When given the choice on additional packages to install only choose SSH.
- Update all packages

```bash
# try running this if full screen so the service screen won't ignore keystrokes
sudo apt update -yq | sudo apt upgrade -yq
```

- **[ssh server](../ssh/ssh.md)** should already be installed but if you forgot to select it during the installation you can install it now.

- ssh to new server from a development system with an updated copy of the repsys repo.

- install build-essentials

```bash
sudo apt install build-essential -y
```

- **[Install FTP server](../ftp/vsftpd-server.md)**
- **[Install FTP client](../ftp/lftp_client.md)**
- **[Install Shell Scripts](../../shell_scripts/install_shell_scripts.md)**
- **[Install curl](./../curl/install-curl.md)**
- **[Install git](../git/git.md)**
- Update **[/etc/hosts file](../hosts/hosts.md)**
- **[Install Screen](../screen/install-screen.md)**
- **[Mount Windows smb device](../smb/mount-smb.md)** Only do this if you need to mount old qnap or a Windows drive
- **[Install mini-conda](../conda/miniconda-install.md)** - Note miniconda needs to be installed for each user.
- **[Install Node version manager](../nvm/install-node-version-manager.md)** - Note Node version manager needs to be installed for each user.
- **[Install Neofetch](../neofetch/install-neofetch.md)**
- **[Install Linux HomeBrew](../homebrew/homebrew-install.md)**
- **[Install dotfiles](../dotfiles/ins  tall-dotfiles.md)**
- **[Install NeoVim](../neovim/install-neovim.md)**
- **[Install MySQL Shell](../mysql/mysql-shell.md)**
- **[Install mongosh](../mongosh/install-mongosh.md)**
- **[Add users with sudo privileges](./create-user.md)**
- **[Install Microk8s](../../reports/k8s/microk8s_1.28_install.md)**
