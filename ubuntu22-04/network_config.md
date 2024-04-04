# Network config

Before starting installation from a computer on the network determine the network gateway and fill out the network table below.

## Find the subnet

```bash
Note the subnet
We can find the subnet mask details using the command below:

ifconfig -a

```

## Find the dns

```bash
nmcli device show enp0s25 | grep IP4.DNS
```

## Find network gateway

```bash
route -n | grep 'UG[ \t]' | awk '{print $2}'
```

## Fill out network table

```bash
Name: rephub11
ip: 192.168.1.201
dns:192.168.1.1
gateway:192.168.1.1
subnet: 255.255.255.0
cidr: 192.168.1.0 /24
```

Now you can use these network setting during the installation process. If you don't do this and instead opt to use dhcp you can follow the below step to setup a static IP after the installation process is finished.

## create **[netplan yaml](../ip/static_ip.md)**

## Create a host network config file

Insert USB drive used for secrets and copy network config into the new host config file.

```bash
code /media/brent/KINGSTON/secrets/hosts/repsys11.md

```
