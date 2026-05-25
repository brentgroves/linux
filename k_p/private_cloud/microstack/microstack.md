# Canonical MicroStack

## References

<https://ubuntu.com/blog/k8s-native-microstack>

## About MicroStack

Canonical MicroStack is an open source project that enables you to easily deploy a fully-functional OpenStack environment on your workstation or even a virtual machine (VM) in minutes. Even though it was originally designed with testing and development use cases in mind, eliminating the need for dedicated hardware, it is now heading towards its first stable release. This means that it will soon be suitable for production use cases too.

The first version of MicroStack was distributed as one big snap package with all OpenStack components in it, running natively on the host where installed. It included core OpenStack components only. This was a good solution, although not so customisable. A beta version has been available for some time and has gained significant community adoption with more than 2,500 active installations. It has never moved towards its first stable release, however. Instead, Canonical has been working on an even more flexible and yet more powerful solution that is both customisable and easy to use.

This is how the K8s-native MicroStack edition was born. It is basically a fresh start for the project. A big part of it was rewritten, and a new architecture was used. This new solution has been in development since 2021, and we released a beta version around October 2022. The first release aimed at a single-node installation, which is already useful for many use cases, such as CI/CD environments. The following versions will expand on that so you can install multi-node clusters.

Many things are different in this new version. Juju is at the heart of the deployment, using Charmed Operators to deploy each OpenStack component as a separate unit. Kubernetes is the substrate for all control plane services. Most OpenStack components become separate pods in K8s. Even the Juju controller itself is hosted there. It leverages the native and natural resilience of the K8s model to deal with OpenStack’s high availability (HA). This eliminates the need for using traditional HA technologies, such as Corosync, Pacemaker, HAProxy and Keepalived. Finally, Juju is driven by Terraform and its new Juju backend provider, making it a nice and easy ramp-up into the Juju world.

Of course, some parts of OpenStack are not a good fit for running inside a container. Services like nova-compute (that drives QEMU/KVM), ovn-chassis (that plugs into the network cards), ceph-osd (that needs access to physical hard drives) work better when run natively on bare metal. This is why those are distributed in a separate package to be installed on hypervisor/storage nodes.

Everything comes packaged as snaps, making OpenStack fully decoupled from the underlying operating system (OS). MicroK8s is used to bootstrap the Kubernetes substrate. MicroStack itself was already available in the snap format, providing cloud management and governance services, with a new snap package for the data plane functions.

## What is OpenStack?

OpenStack is a collection of open-source projects designed to work together to form the basis of a cloud. OpenStack can be used for both private and public cloud implementation.

OpenStack is no doubt a wonderful and successful piece of software. It allows you to create your own cloud infrastructure, and thanks to its open-source nature, it’s free to use for everyone. But as with many giant software projects, all that power comes with a challenge: it is reasonably complex to install and configure. A number of OpenStack distributions do exist that intend to make engineers’ life a lot easier, but those also tend to be more complex than a non-experienced user would like them to be.

To solve this problem once and for all, Canonical created a simplified and easy-to-install distribution of OpenStack called **[MicroStack](https://microstack.run/).
