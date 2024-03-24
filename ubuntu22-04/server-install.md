# Install Ubuntu 22.04 Server

## Network config

Before starting installation from a computer on the network determine the network gateway and fill out the network table below.

### Find the dns

```bash
Note the subnet
We can find the subnet mask details using the command below:

ifconfig -a

```
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
ip: 192.168.1.200
dns:192.168.1.1
gateway:192.168.1.1
subnet: 255.255.255.0
cidr: 192.168.1.0/24
```

### create netplan yaml

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
sudo apt update -yq | sudo apt upgrade -yq
```

- **[ssh](../ssh/ssh.md)** should already be installed

- install build-essentials

```bash
sudo apt install build-essential -y
```

- **[Install curl](./../curl/install-curl.md)**

- **[Install Git](../git/git.md)** EAxejwisiakJip3

- Update **[/etc/hosts file](../hosts/hosts.md)**

- **[Install Screen](../screen/install-screen.md)**

- Only do this if you need to mount old qnap or a Windows drive for some reason **[Mount Windows smb device](../smb/mount-smb.md)**

- **[Install FTP server](../ftp/ftp-server.md)**

- **[Install FTP client](../ftp/ftp-client.md)**

- **[Install mini-conda](../conda/miniconda-install.md)** - Note miniconda needs to be installed for each user.

- **[Install Node version manager](../nvm/install-node-version-manager.md)** - Note Node version manager needs to be installed for each user.

- **[Install Neofetch](../neofetch/install-neofetch.md)**

- **[Install Linux HomeBrew](../homebrew/homebrew-install.md)**

- **[Install dotfiles](./dotfiles/dotfiles.md)**

- **[Install NeoVim](../neovim/install-neovim.md)**

- **[Install MySQL Shell](../mysql/mysql-shell.md)**

- **[Install mongosh](../mongosh/install-mongosh.md)**

- **[Add users with sudo privileges](./create-user.md)**

- **[Install Microk8s](../../reports/k8s/microk8s_1.28_install.md)**
