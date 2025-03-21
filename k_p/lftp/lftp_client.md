# **[lftp client](https://linuxopsys.com/topics/lftp-commands)**

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

```bash
sudo apt install lftp
```

## copy shell scripts to server

```bash
# From dev system 
cd ~/src/repsys/volumes/shell_scripts
ssh brent@repsys12
mkdir -p ~/bin/shell_scripts/
chmod 755 ~/bin/shell_scripts/
exit

# upload shell scripts to server
lftp brent@repsys12
:~> cd ~/bin/shell_scripts #this is in dotfiles path
:~> local ls
:~> mput *.sh
exit

# copy kube config files to server
ssh brent@repsys12
mkdir ~/.kube
chmod 766 ~/.kube
exit

cd ~/src/k8s/all-config-files
# upload kube config files to server .config dir
lftp brent@repsys12
:~> cd .kube
:~> mput *.yaml
exit
```

- issue connecting to <https://10.97.219.76:16443> or <https://10.188.50.214:16443>
  - connected to <https://10.97.219.76:16443> from 10.188.50.214 and 10.188.50.202.
  - changed config ip to 10.188.50.214
  - could not connect from 10.188.50.202
  - could not ssh to 10.188.50.214
  - ssh to 10.188.50.202
  - multipass list
  k8sn211 suspended
AI overview: why would multipass vm say suspended
To resume a suspended VM, use the multipass start command.
multipass start k8sn211
start failed: cannot connect to the multipass socket
sudo journalctl -au snap.multipass
**[search](https://stackoverflow.com/questions/67776548/how-to-fix-multipass-error-list-failed-cannot-connect-to-the-multipass-socket)**

For kubectl to function correctly, firewall access needs to be open for TCP traffic on port 6443 (Kubernetes API server) and potentially other ports depending on your cluster configuration.
Here's a more detailed breakdown:
Kubernetes API Server:
The default port for the Kubernetes API server is 6443, but this can be configured.
kubectl uses this API server to interact with the cluster.
You need to ensure that inbound TCP traffic on this port (or the configured port) is allowed from the machine where you're running kubectl to the Kubernetes master node.
