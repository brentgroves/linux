# OpenStack Install

## References

<https://www.youtube.com/watch?v=ifDtBM_EHPE>
<https://microstack.run/docs/multi-node>

## OpenStack Single-Node

In this video you will learn how to Install OpenStack in five simple steps.

Looking for an easy OpenStack installation tutorial for beginners?
Break the ice with OpenStack today by watching this video.

You will only need one physical or virtual machine with:

1) The latest Ubuntu LTS installed,
2) Static IP address assigned to its primary network interface,
3) OpenSSH server installed and configured,
4) 4+ core amd64 CPU,
5) 16 GB of RAM,
6) 50 GB of SSD storage.

Get OpenStack up and running in under an hour by running five simple commands:

$ sudo snap install openstack
$ sunbeam prepare-node-script | bash -x && newgrp snap_daemon
$ sunbeam cluster bootstrap --accept-defaults
$ sunbeam configure --accept-defaults --openrc demo-openrc
$ sunbeam launch ubuntu -n test

Additional resources:
MicroStack website: <https://microstack.run>
Sunbeam documentation: <https://microstack.run/docs>
OpenStack tutorials for beginners: <https://ubuntu.com/openstack/tutorials>
OpenStack cheat sheet: <https://ubuntu.com/openstack/openstac>...
Report a bug in Sunbeam: <https://bugs.launchpad.net/snap-opens>...
Get community help: <https://discourse.charmhub.io/tag/mic>...
Purchase commercial support: <https://ubuntu.com/pro>

## OpenStack Multi-Node

<https://microstack.run/docs/multi-node>

This tutorial shows how to install a multi-node MicroStack cluster. It will deploy an OpenStack 2023.1 (Antelope) cloud.

Requirements
You will need three machines, each of which has the following requirements:

physical machine running Ubuntu 22.04 LTS
a multi-core amd64 processor (ideally with 4+ cores)
a minimum of 32 GiB of free memory
200 GiB of SSD storage available on the root disk
a least one un-partitioned disk of at least 200 GiB in size
two network interfaces
primary: for access to the OpenStack control plane
secondary: for remote access to cloud VMs
Caution: Any change in IP address of any machine will be detrimental to the deployment. Dedicated physical machines with fixed IP address allocations are therefore recommended.

Machine names
For the purpose of this tutorial, the following machine names are used:

MACHINE FQDN
sunbeam01 sunbeam01.example.com
sunbeam02 sunbeam02.example.com
sunbeam03 sunbeam03.example.com
Control plane networking
The network associated with the primary interface requires a ranage of approximately ten IP addresses that will be used for API service endpoints.

For the purposes of this tutorial, the following configuration is in place:

NETWORK COMPONENT VALUE
CIDR 10.249.148.0/24
Gateway 10.249.148.1
DHCP address range 10.249.148.10-10.249.148.199
Control plane address range 10.249.148.200-10.249.148.210
Interface name on machine enp5s0
External networking
The network associated with the secondary interface requires a range of IP addresses that will be sufficient for allocating floating IP addresses to VMs. This will in turn allow them to be contacted by remote hosts.

For the purposes of this tutorial, the following external network configuration is in place:

NETWORK COMPONENT VALUE
CIDR 10.86.41.0/24
Gateway 10.86.41.1
DHCP address range 10.86.41.2-10.86.41.20
Floating IP address range 10.86.41.21-10.86.41.200
Interface name on machine
