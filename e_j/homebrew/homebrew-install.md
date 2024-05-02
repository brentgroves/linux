# Install HomeBrew package manager

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

- Needed this to install k9s

## References

<https://docs.brew.sh/Homebrew-on-Linux>
<https://github.com/orgs/Homebrew/discussions/3396>

## you may have to reinstall curl
The snap installation of **[curl](https://stackoverflow.com/questions/67541374/nvm-getting-permission-denied-with-nvm-install-command)**
 maybe newer but it has problems installing nvm and maybe homebrew.

```bash

sudo snap remove curl
sudo apt install curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```
