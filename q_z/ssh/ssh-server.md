# install ssh server

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

<https://linuxhint.com/enable-use-ssh-ubuntu/>

```bash
# check if its installed
sudo systemctl status ssh

sudo apt install openssh-server -y
sudo systemctl status ssh

# copy clients public key to remote hosts ~/.ssh/authorized_keys file
# https://www.simplified.guide/ssh/copy-public-key

# From ssh client computer
# Add your SSH public key to remote server user's authorized_keys file using ssh-copy-id command.
ssh-copy-id brent@repsys11
ssh-copy-id brent@repsys12
ssh-copy-id cstangland@reports11
ssh-copy-id cstangland@reports12
ssh-copy-id cstangland@reports13
```
