# **[Install gnome-keyring](https://gist.github.com/keirlawson/0e3ac20728f9a0535eec)**

## AI Overview

To install and configure GNOME Keyring on Ubuntu, you'll need to install the gnome-keyring package and then enable the GNOME Keyring PAM module. This ensures that your keyring is unlocked automatically when you log in.
Here's a step-by-step guide:

1. Install the GNOME Keyring Package:
Open a terminal.
Run the following command to install the gnome-keyring package:

```bash
sudo apt-get install gnome-keyring
```

Confirm the installation by pressing 'Y' when prompted.

2. Enable the GNOME Keyring PAM Module:

Open a terminal.
Run the following command to ensure the PAM module is enabled for graphical login:

```bash
sudo apt-get install libpam-gnome-keyring
```

Confirm the installation by pressing 'Y' when prompted.
This step configures the PAM (Pluggable Authentication Modules) to automatically unlock the keyring during login.

3. Verify Installation:
You can check if the GNOME Keyring is installed and running by using the following commands:

```bash
gnome-keyring-daemon --version
```

This should output the version of the GNOME Keyring daemon.
If you encounter issues with the keyring not unlocking or being automatically activated, you may need to adjust your PAM configuration files. You can refer to resources like the Ask Ubuntu post for more detailed instructions on configuring PAM for GNOME Keyring.
Additionally, you can run seahorse to manage your GNOME Keyring and ensure that it is working correctly.
Troubleshooting:
If you encounter issues after installing, ensure the gnome-keyring-daemon is running. You can try starting it manually using:

```bash
gnome-keyring-daemon --start --components=secrets
discover_other_daemon: 1GNOME_KEYRING_CONTROL=/run/user/1000/keyring
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
```

If you're using a different display manager (other than GDM or LightDM), you might need to configure PAM specifically for your display manager.
You can also consult the Ubuntu documentation or forums for further assistance in troubleshooting.

## you are running in a gnome environment but the os keyring is not available for encryption

## **[Troubleshooting keychain issues](https://code.visualstudio.com/docs/configure/settings-sync#_troubleshooting-keychain-issues)**

## **[fix vscode issue](https://stackoverflow.com/questions/78422507/vs-code-github-auth-not-working-on-linux-due-to-gnome-environment-os-keyring-err)**

```bash
sudo apt install gnome-keyring
```

## Make sure gnome-keyring is running

```bash
ps aux | grep gnome-keyring
brent       2405  0.0  0.0 1013452 10440 ?       SLsl May21   0:00  \_ /usr/bin/gnome-keyring-daemon --foreground --components=pkcs11,secrets --control-directory=/run/user/1000/keyring
brent      83399  0.0  0.0  17948  2104 pts/1    S+   18:29   0:00  |   |           \_ grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox --exclude-dir=.venv --exclude-dir=venv gnome-keyring
```

If not running:

`gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg`

Check if the libsecret library is installed:

```bash
sudo apt install libsecret-1-0 libsecret-1-dev
```

## Configure VSCode to use gnome-keyring

Once gnome-keyring is installed and running, open VSCode and find the configuration file (settings.json) and add the following configuration to enable GNOME Keychain storage.:

`> "security.workspace.trust.enabled": true`

## **[https://code.visualstudio.com/docs/configure/settings-sync#_troubleshooting-keychain-issues](https://code.visualstudio.com/docs/configure/settings-sync#_troubleshooting-keychain-issues)**

<https://wiki.gnome.org/Apps/Seahorse>
