# **[Packet filtering and firewalls](https://docs.docker.com/engine/network/packet-filtering-firewalls/)**

**[Ubuntu 22.04 Desktop](../../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../../README.md)**

On Linux, Docker creates iptables and ip6tables rules to implement network isolation, port publishing and filtering.

Because these rules are required for the correct functioning of Docker bridge networks, you should not modify the rules created by Docker.

But, if you are running Docker on a host exposed to the internet, you will probably want to add iptables policies that prevent unauthorized access to containers or other services running on your host. This page describes how to achieve that, and the caveats you need to be aware of.

Note

Docker creates iptables rules for bridge networks.

No iptables rules are created for ipvlan, macvlan or host networking.

## Docker and iptables chains

In the filter table, Docker sets the default policy to DROP, and creates the following custom iptables chains:

DOCKER-USER
A placeholder for user-defined rules that will be processed before rules in the DOCKER-FORWARD and DOCKER chains.
DOCKER-FORWARD
The first stage of processing for Docker's networks. Rules that pass packets that are not related to established connections to the other Docker chains, as well as rules to accept packets that are part of established connections.
DOCKER
Rules that determine whether a packet that is not part of an established connection should be accepted, based on the port forwarding configuration of running containers.
DOCKER-ISOLATION-STAGE-1 and DOCKER-ISOLATION-STAGE-2
Rules to isolate Docker networks from each other.
DOCKER-INGRESS
Rules related to Swarm networking.
In the FORWARD chain, Docker adds rules that unconditionally jump to the DOCKER-USER, DOCKER-FORWARD and DOCKER-INGRESS chains.

In the nat table, Docker creates chain DOCKER and adds rules to implement masquerading and port-mapping.
