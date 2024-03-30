# Install HomeBrew package manager

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
