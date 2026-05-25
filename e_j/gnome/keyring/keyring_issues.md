# **[Troubleshooting keychain issues](https://code.visualstudio.com/docs/configure/settings-sync#_troubleshooting-keychain-issues)**

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
