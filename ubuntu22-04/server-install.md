# Ubuntu 22.04 Server Install

**[Report System Install](../../k8s/report-system-install.md)**\
**[Current Status](../../development/status/weekly/current_status.md)**\
**[Back to Main](../../README.md)**

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

- **[Install FTP server](../q_z/vsftpd/vsftpd-server.md)**
- **[Install FTP client](../k_p/lftp/lftp_client.md)**
- **[Install Shell Scripts](../../volumes/shell_scripts/install_shell_scripts.md)**
- **[Install curl](../a_d/curl/install-curl.md)**
- **[Install git](../e_j/git/git.md)**
- Update **[/etc/hosts file](../e_j/hosts/)**
- **[Install Screen](../q_z/screen/install-screen.md)**
- **[Mount Windows smb device](../q_z/smb/mount-smb.md)** Only do this if you need to mount old qnap or a Windows drive
- **[Install mini-conda](../a_d/conda/miniconda-install.md)** - Note miniconda needs to be installed for each user.
- **[Install Node version manager](../k_p/nvm/install-node-version-manager.md)** - Note Node version manager needs to be installed for each user and should be installed for **[neovim issue](https://github.com/neoclide/coc.nvim/issues/856)**.
- **[Install Neofetch](../k_p/neofetch/install-neofetch.md)**
- **[Install Linux HomeBrew](../e_j/homebrew/homebrew-install.md)**
- **[Install dotfiles](../a_d/dotfiles/install-dotfiles.md)**
- **[Install NeoVim](../k_p/neovim/install-neovim.md)**
- **[Install MySQL Shell](../k_p/mysql/mysql-shell.md)**
- **[Install MySQL Client](../k_p/mysql/mysql-client.md)**
- **[Install mongosh](../k_p/mongosh/install-mongosh.md)**
- **[Add users with sudo privileges](./create-user.md)**
- **[Install Microk8s](../../k8s/report-system-install.md)**
