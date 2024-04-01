# Install Ubuntu 22.04 Server

## Network config

Before starting installation from a computer on the network determine the network gateway and fill out the network table below.

### Find the subnet

```bash
Note the subnet
We can find the subnet mask details using the command below:

ifconfig -a

```
### Find the dns

```bash
nmcli device show enp0s25 | grep IP4.DNS
```

### Find network gateway
```bash
route -n | grep 'UG[ \t]' | awk '{print $2}'
```

### Fill out network table
```bash
Name: rephub11
ip: 192.168.1.201
dns:192.168.1.1
gateway:192.168.1.1
subnet: 255.255.255.0
cidr: 192.168.1.0 /24
```

Now you can use these network setting during the installation process. If you don't do this and instead opt to use dhcp you can follow the below step to setup a static IP after the installation process is finished. 


### create netplan yaml

Only needed if you did not configure a static IP during the install. 
```yaml
network:
 version: 2
 renderer: NetworkManager
 ethernets:
   enp0s25:
     dhcp4: no
     addresses: [192.168.1.200/24]
     gateway4: 192.168.1.1
     nameservers:
         addresses: [192.168.1.1]
```

network:
  ethernets:
    enp0s25:
      dhcp4: true
  version: 2
  
### create the netplan file

```bash
sudo vi /etc/netplan/00-installer-config.yaml
```

Follow these instructions to **[install Ubuntu 22.04 server](https://ostechnix.com/install-ubuntu-server/)**
When given the choice on additional packages to install only choose SSH.

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
