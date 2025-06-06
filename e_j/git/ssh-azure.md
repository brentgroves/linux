# Setup user for SSH access to use Azure Dev Ops

Note you must have admin permissions to Azure Dev Ops project to do this.

## Reference

<https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops>

## Add RSA support to SSH

```bash
mkdir ~/.ssh
vi ~/.ssh/config
Host ssh.dev.azure.com
    User git
    PubkeyAcceptedAlgorithms +ssh-rsa
    HostkeyAlgorithms +ssh-rsa

# generate an RSA key accept default with no passcode

ssh-keygen -t rsa -C "cstangland@mobexglobal.com"
ssh-keygen -t rsa -C "bcook@mobexglobal.com"
ssh-keygen -t rsa -C "jdavis@mobexglobal.com"
ssh-keygen -t rsa -C "bcieslik@mobexglobal.com"
ssh-keygen -t rsa -C "sjackson@mobexglobal.com"
ssh-keygen -t rsa -C "kyoung@mobexglobal.com"
ssh-keygen -t rsa -C "bgroves@mobexglobal.com"
ssh-keygen -t rsa -C brent.groves@gmail.com 

ssh-keygen -t rsa -C "rdecker@linamar.com"
ssh-keygen -t rsa -C "bhall@linamar.com"

# start the ssh-agent if not already started
# We don't normally need to stop and start the ssh-agent on Ubuntu 22.04 desktop but on Ubuntu 22.04 server you may need to

eval "$(ssh-agent -s)"

# Add private key to ssh-agent.
ssh-add ~/.ssh/id_rsa

# Add public part to azure dev op ssh keys.

# List the current ssh keys
ssh-add -L

# Open your security settings by browsing to the web portal and selecting your avatar in the upper right of the user interface. Select SSH public keys in the menu that appears.

# Check for existing keys
ls –al ~/.ssh


# https://aex.dev.azure.com/

# Add public part to azure dev op ssh keys.

# Ssh public keys under user settings.

cat ~/.ssh/id_rsa.pub


mkdir ~/src
cd ~/src
git clone git@ssh.dev.azure.com:v3/MobexGlobal/MobexCloudPlatform/send_email_python
cd send_email_python
git remote –v

<https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes>
```
