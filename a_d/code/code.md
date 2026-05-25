# Install Visual Studio Code

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## **[Ubuntu 26.04](https://linuxconfig.org/how-to-install-visual-studio-code-on-ubuntu-26-04)**

```bash
$ sudo apt update
$ sudo apt install curl gpg apt-transport-https
$ curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
$ echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
$ sudo apt update
$ sudo apt install code
code --version
```

<https://code.visualstudio.com/docs/setup/linux>

Debian and Ubuntu based distributions#
The easiest way to install Visual Studio Code for Debian/Ubuntu based distributions is to download and install the .deb package (64-bit), either through the graphical software center if it's available, or through the command line with:

## **[download](https://code.visualstudio.com/download)**

```bash


cd ~/Downloads
sudo apt install code_1.87.2-1709912201_amd64.deb 
#  this gave me a permission error
# but it was still install. The next install i right clicked on the file and installed it from the software center and it gave me no error.
# N: Download is performed unsandboxed as root as file '/home/brent/Downloads/code_1.87.2-1709912201_amd64.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)

# If you're on an older Linux distribution, you will need to run this instead:
# sudo dpkg -i <file>.deb
# sudo apt-get install -f # Install dependencies
# Note that other binaries are also available on the VS Code download page.

# Installing the .deb package will automatically install the apt repository and signing key to enable auto-updating using the system's package manager. Alternatively, the repository and key can also be installed manually with the following script:

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
# Then update the package cache and install the package using:
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
```

## **[Install Extensions](./extensions.md)**

## **[Use VSCode for Web](./vscode_for_web.md)**

You can use it for light-weight code changes and share links with others so they can view your code and documentation more easily.

**[Visual Studio Code Web](https://github.dev/brentgroves/repsys/blob/main/development/status/weekly/current_status.md)**
