# Proxmox

Proxmox Virtual Environment (Proxmox VE or PVE) is a hyper-converged infrastructure open-source software. It is a hosted hypervisor that can run operating systems including Linux and Windows on x64 hardware. It is a Debian-based Linux distribution with a modified Ubuntu LTS kernel[7] and allows deployment and management of virtual machines and containers.[8][9] Two types of virtualization are supported: container-based with LXC (starting from version 4.0 replacing OpenVZ used in version up to 3.4, included[10]), and full virtualization with KVM.[11] It includes a web-based management interface.[12][13] There is also mobile application available for controlling PVE environments.[14]

## References

<https://en.wikipedia.org/wiki/Proxmox_Virtual_Environment>

## History

Development of Proxmox VE started when Dietmar Maurer and Martin Maurer, two Linux developers, found out OpenVZ had no backup tool and no management GUI. KVM was appearing at the same time in Linux, and was added shortly afterwards.[15]

The first public release took place in April 2008. It supported container and full virtualization, managed with a web-based user interface similar to other commercial offerings.[16]

## Features

Proxmox VE is an open-source server virtualization platform to manage two virtualization technologies: Kernel-based Virtual Machine (KVM) for virtual machines and LXC for containers - with a single web-based interface.[11] It also integrates out-of-the-box-tools for configuring high availability between servers, software-defined storage, networking, and disaster recovery.[17]

Proxmox VE supports live migration for guest machines between nodes in the scope of a single cluster, which allows smooth migration without interrupting their services.[18] Since PVE 7.3 there is experimental feature for migration between unrelated nodes in different clusters.[19]

PVE can be integrated with LDAP and ActiveDirectory servers.[20]

Guest machines backup can be done using included standalone vzdump tool.[21] PVE can be also integrated with separate machine Proxmox Backup Server (PBS) using web GUI[22] or with text based Proxmox Backup Client application.[23]

Since PVE 8 along with standard GUI installer there's a semi-graphic (TUI) installer integrated into the ISO image.[20]
