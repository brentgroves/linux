# Install HomeBrew package manager

- Needed this to install k9s

## References

<https://docs.brew.sh/Homebrew-on-Linux>
<https://github.com/orgs/Homebrew/discussions/3396>

```bash
## you may have to reinstall curl
sudo snap remove curl
sudo apt install curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```
