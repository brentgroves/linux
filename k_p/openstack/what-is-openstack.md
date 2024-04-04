# What is OpenStack

WHAT IS OPENSTACK? HOW DOES IT BUILD AN IAAS CLOUD?
OpenStack is a leader in open source cloud management systems (CMS) that, while it can be used to build PaaS and SaaS model clouds, was initially intended to provide IaaS cloud functionality. What is OpenStack and how does it provide an Infrastructure-as-a-Service? OpenStack is a collection of (primarily) python-based software projects that manage access to pooled storage, compute and network resources. There is a growing system of service projects that extend OpenStack’s functionality, but which are anchored by a a core set of six projects: Neutron (Networking), Nova (Compute) Glance (Image Management), Swift (Object Storage), Cinder (Block Storage) and Keystone (Authorization and Authentication). Want more detail?

## References

<https://kumul.us/what-is-openstack/>

<https://ubuntu.com/tutorials/explore-openstack-components-and-set-up-an-openstack-client#1-overview>

## What is OpenStack?

OpenStack is a collection of open-source projects designed to work together to form the basis of a cloud. OpenStack can be used for both private and public cloud implementation.

## What is Sunbeam?

Sunbeam is an OpenStack project created to set the foundation for zero-ops OpenStack. By using highly opinionated architecture and native Kubernetes principles, Sunbeam delivers distilled OpenStack excellence on top of K8s.

## What is MicroStack?

MicroStack (based on Sunbeam) is an OpenStack flavour designed for small-scale cloud environments, edge deployments, testing and development, with full commercial support available from Canonical.

## The following hypervisors are supported by OpenStack

KVM - Kernel-based Virtual Machine. The virtual disk formats that it supports is inherited from QEMU since it uses a modified QEMU program to launch the virtual machine. The supported formats include raw images, the qcow2, and VMware formats.

LXC - Linux Containers (through libvirt), used to run Linux-based virtual machines.

QEMU - Quick EMUlator, generally only used for development purposes.

VMware vSphere 5.1.0 and newer - Runs VMware-based Linux and Windows images through a connection with a vCenter server.

Hyper-V - Server virtualization with Microsoft Hyper-V, use to run Windows, Linux, and FreeBSD virtual machines. Runs nova-compute natively on the Windows virtualization platform.

Virtuozzo 7.0.0 and newer - OS Containers and Kernel-based Virtual Machines supported. The supported formats include ploop and qcow2 images.

zVM - Server virtualization on z Systems and IBM LinuxONE, it can run Linux, z/OS and more.

Ironic - OpenStack project which provisions bare metal (as opposed to virtual) machines.
