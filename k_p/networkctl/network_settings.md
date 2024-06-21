# **[network settings](https://linuxconfig.org/setting-a-static-ip-address-in-ubuntu-24-04-via-the-command-line)**

## **[50-cloud-init](https://ubuntuforums.org/showthread.php?t=2492108)**

## Brent's summary

I updated /etc/netplan/50-cloud-init.yaml at it's changes persisted on reboot but if I start having network problems this is the first place I will check

## Setting a Static IP Address in Ubuntu 24.04 via the Command Line

Configuring a static IP address on your Ubuntu server is essential for various reasons, such as ensuring consistent network configuration, facilitating server management, and improving network security. Ubuntu 24.04, like its predecessors, uses the Netplan utility for network configuration, which simplifies the process of setting a static IP address through YAML configuration files.

Note: Before running networkctl, ensure that systemd-networkd is running, otherwise you will get incomplete output indicated by the following error.

You can check the status of systemd-networkd by running the following systemctl command.

```bash
sudo systemctl status systemd-networkd
```

## Configuring a Static IP Address

Before diving into the configuration steps, ensure you have sudo or root access to the Ubuntu system. This access is necessary for editing network configuration files and applying changes.

Identify Your Network Interface: To set a static IP address, you first need to know which network interface you’re configuring.

```bash
networkctl
IDX LINK      TYPE     OPERATIONAL SETUP      
  1 lo        loopback carrier     unmanaged
  2 enp66s0f0 ether    no-carrier  configuring
  3 enp66s0f1 ether    no-carrier  configuring
  4 enp66s0f2 ether    no-carrier  configuring
  5 eno1      ether    routable    configured 
  6 enp66s0f3 ether    no-carrier  configuring
  7 eno2      ether    routable    configured 
  8 eno3      ether    no-carrier  configuring
  9 eno4      ether    no-carrier  configuring

9 links listed.
```

To list various details of specific network interface called enp7s0, you can run the following command, which will list network configuration files, type, state, IP addresses (both IPv4 and IPv6), broadcast addresses, gateway, DNS servers, domain, routing information, maximum transmission unit (MTU), and queuing discipline (QDisc).

```bash
networkctl status eno1  
● 5: eno1
                   Link File: /usr/lib/systemd/network/99-default.link
                Network File: /run/systemd/network/10-netplan-eno1.network
                       State: routable (configured)
                Online state: online                                                  
                        Type: ether
                        Path: pci-0000:01:00.0
                      Driver: igb
                      Vendor: Intel Corporation
                       Model: I350 Gigabit Network Connection (Gigabit 4P I350-t rNDC)
           Alternative Names: enp1s0f0
            Hardware Address: b8:ca:3a:6a:37:18 (Dell Inc.)
                         MTU: 1500 (min: 68, max: 9216)
                       QDisc: mq
IPv6 Address Generation Mode: eui64
    Number of Queues (Tx/Rx): 8/8
            Auto negotiation: yes
                       Speed: 1Gbps
                      Duplex: full
                        Port: tp
                     Address: 10.1.0.125
                              fe80::baca:3aff:fe6a:3718
                     Gateway: 10.1.1.205
                         DNS: 10.1.2.69
                              10.1.2.70
                              172.20.0.39
           Activation Policy: up
         Required For Online: yes
           DHCP6 Client DUID: DUID-EN/Vendor:0000ab1143a9fd4c0ea3e28c
```

Edit the Netplan Configuration File: Netplan configuration files are stored in /etc/netplan/. You will find this file in the /etc/netplan directory. It might be named 01-netcfg.yaml, 50-cloud-init.yaml, or something similar, depending on your setup. Open or create a file for editing.

```bash
$ sudo nano /etc/netplan/01-netcfg.yaml
Here’s an example configuration to set a static IP address:

network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.1.10/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

Replace ‘enp0s3’ with your interface name. Adjust the IP address, subnet mask, default gateway, and DNS servers as necessary for your network.

Apply the Configuration Changes: Once you’ve edited the configuration file, apply the changes to update your network settings.

```bash
sudo netplan try
$ sudo netplan apply
```
