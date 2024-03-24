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

```bash
# run this then
$ sudo apt-get install openvswitch-switch-dpdk
```
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s25:
      addresses:
        - 192.168.1.200/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
          search: [rephub, busche-cnc.com]
          addresses: [192.168.1.1]
```

The configuration can then be applied using the netplan command.
```bash
sudo netplan try
sudo netplan apply
```
## **[Set static ip in ubuntu](https://www.freecodecamp.org/news/setting-a-static-ip-in-ubuntu-linux-ip-address-tutorial/)**

## Step 2: Note information about the current network
We will need our current network details such as the current assigned IP, subnet mask, and the network adapter name so that we can apply the necessary changes in the configurations.

Use the command below to find details of the available adapters and the respective IP information.

ip a
The output will look something like this:

![](https://www.freecodecamp.org/news/content/images/2023/03/image-14.png)

For my network, the current adapter is eth0. It could be different for your system

Note the current network adapter name
As my current adapter is eth0, the below details are relevant.

6: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:df:c3:ad brd ff:ff:ff:ff:ff:ff
    inet 172.23.199.129/20 brd 172.23.207.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::215:5dff:fedf:c3ad/64 scope link
       valid_lft forever preferred_lft forever
It is worth noting that the current IP 172.23.199.129 is dynamically assigned. It has 20 bits reserved for the netmask. The broadcast address is 172.23.207.255.

Note the subnet
We can find the subnet mask details using the command below:

ifconfig -a
Select the output against your adapter and read it carefully.

## Step 3: Make configuration changes
Netplan is the default network management tool for the latest Ubuntu versions. Configuration files for Netplan are written using YAML and end with the extension .yaml.

Note: Be careful about spaces in the configuration file as they are part of the syntax. Without proper indentation, the file won't be read properly.

Go to the netplan directory located at /etc/netplan.
ls into the /etc/netplan directory.

If you do not see any files, you can create one. The name could be anything, but by convention, it should start with a number like 01- and end with .yaml. The number sets the priority if you have more than one configuration file.

I'll create a file named 01-network-manager-all.yaml.

Let's add these lines to the file. We'll build the file step by step.

network:
 version: 2
01-network-manager-all.yaml
The top-level node in a Netplan configuration file is a network: mapping that contains version: 2 (means that it is using network definition version 2).

Next, we'll add a renderer, that controls the overall network. The renderer is systemd-networkd by default, but we'll set it to NetworkManager.

Now, our file looks like this:

network:
 version: 2
 renderer: NetworkManager
Next, we'll add ethernets and refer to the network adapter name we looked for earlier in step#2. Other device types supported are modems:, wifis:, or bridges:.

network:
 version: 2
 renderer: NetworkManager
 ethernets:
   eth0:
01-network-manager-all.yaml
As we are setting a static IP and we do not want to dynamically assign an IP to this network adapter, we'll set dhcp4 to no.

network:
 version: 2
 renderer: NetworkManager
 ethernets:
   eth0:
     dhcp4: no
01-network-manager-all.yaml
Now we'll specify the specific static IP we noted in step #2 depending on our subnet and the usable IP range. It was 172.23.207.254.

Next, we'll specify the gateway, which is the router or network device that assigns the IP addresses. Mine is on 192.168.1.1.

network:
 version: 2
 renderer: NetworkManager
 ethernets:
   eth0:
     dhcp4: no
     addresses: [172.23.207.254/20]
     gateway4: 192.168.1.1
01-network-manager-all.yaml
Next, we'll define nameservers. This is where you define a DNS server or a second DNS server. Here the first value is  8.8.8.8 which is Google's primary DNS server and the second value is 8.8.8.4 which is Google's secondary DNS server. These values can vary depending on your requirements.

network:
 version: 2
 renderer: NetworkManager
 ethernets:
   eth0:
     dhcp4: no
     addresses: [172.23.207.254/20]
     gateway4: 192.168.1.1
     nameservers:
         addresses: [8.8.8.8,8.8.8.4]
01-network-manager-all.yaml
Step 4: Apply and test the changes
We can test the changes first before permanently applying them using this command:

sudo netplan try
If there are no errors, it will ask if you want to apply these settings.

Now, finally, test the changes with the command ip a and you'll see that the static IP has been applied.

# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s25:
      dhcp4: true
  version: 2
