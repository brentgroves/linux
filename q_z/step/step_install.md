# **[Step CLI](https://smallstep.com/docs/step-cli/installation/#debian-ubuntu)

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

Linux Packages (amd64)
Debian/Ubuntu
Download and install the Debian package from our latest release:

```bash
wget https://dl.smallstep.com/cli/docs-cli-install/latest/step-cli_amd64.deb
sudo dpkg -i step-cli_amd64.deb
```

To uninstall, run `sudo dpkg -r step-cli` and remove the $HOME/.step configuration directory.

## usage

```bash
istioctl proxy-config all deploy/productpage-v1 -o json | \
  jq -r '.. |."secret"?' | \
  jq -r 'select(.name == "default")' | \
  jq -r '.tls_certificate.certificate_chain.inline_bytes' | \
  base64 -d - | step certificate inspect
  ```
