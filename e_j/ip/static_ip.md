# https://ubuntu.com/server/docs/configuring-networks

## IP addressing
The following section describes the process of configuring your system’s IP address and default gateway needed for communicating on a local area network and the Internet.

Temporary IP address assignment
For temporary network configurations, you can use the ip command which is also found on most other GNU/Linux operating systems. The ip command allows you to configure settings which take effect immediately – however they are not persistent and will be lost after a reboot.

To temporarily configure an IP address, you can use the ip command in the following manner. Modify the IP address and subnet mask to match your network requirements.

sudo ip addr add 10.102.66.200/24 dev enp0s25
The ip can then be used to set the link up or down.

ip link set dev enp0s25 up
ip link set dev enp0s25 down
To verify the IP address configuration of enp0s25, you can use the ip command in the following manner:

ip address show dev enp0s25
10: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:16:3e:e2:52:42 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.102.66.200/24 brd 10.102.66.255 scope global dynamic eth0
       valid_lft 2857sec preferred_lft 2857sec
    inet6 fe80::216:3eff:fee2:5242/64 scope link
       valid_lft forever preferred_lft forever6

To configure a default gateway, you can use the ip command in the following manner. Modify the default gateway address to match your network requirements.

sudo ip route add default via 192.168.1.1

You can also use the ip command to verify your default gateway configuration, as follows:

ip route show
default via 10.102.66.1 dev eth0 proto dhcp src 10.102.66.200 metric 100
10.102.66.0/24 dev eth0 proto kernel scope link src 10.102.66.200
10.102.66.1 dev eth0 proto dhcp scope link src 10.102.66.200 metric 100 

Static IP address assignment
To configure your system to use static address assignment, create a netplan configuration in the file /etc/netplan/99_config.yaml. The example below assumes you are configuring your first Ethernet interface identified as eth0. Change the addresses, routes, and nameservers values to meet the requirements of your network.

## install prereq services

```bash
# run this then
$ sudo apt-get install openvswitch-switch-dpdk
```

## create the netplan file

```bash
sudo vi /etc/netplan/00-installer-config.yaml
```


```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s25:
      addresses:
        - 192.168.1.61/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
          # search: [rephub, busche-cnc.com]
          addresses: [192.168.1.1]
```

The configuration can then be applied using the netplan command.
```bash
sudo netplan apply
```
