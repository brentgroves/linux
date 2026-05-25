# **[az install](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=apt))**

**[Ubuntu 22.04 Desktop](../../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../../README.md)**

This article explains how to install the Azure CLI on Linux. Select the appropriate package manager for your distribution from the options at the top of the page. Using a Linux distribution's package manager is recommended, but you may manually install the Azure CLI on Linux by selecting the **[Install script](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=script)** option.

The current version of the Azure CLI is 2.72.0. For information about the latest release, see the release notes. To find your installed version and see if you need to update, run az version.

## Before you begin

The apt package manager contains x86_64 and ARM64 packages for the Azure CLI that has been tested on the following distributions.

### Distribution Version

- Debian 11 (Bullseye), 12 (Bookworm)
- Ubuntu 20.04 LTS (Focal Fossa), 22.04 (Jammy Jellyfish), 24.04 (Noble Numbat)

Ubuntu 20.04 (Focal Fossa) and 20.10 (Groovy Gorilla) include an azure-cli package with version 2.0.81 provided by the universe repository. This package is outdated and not recommended. If this package is installed, remove the package before continuing by running the command sudo apt remove azure-cli -y && sudo apt autoremove -y. For more information on apt remove, see the Ubuntu package management or ask ubuntu.

## Install Azure CLI

There are two options to install the Azure CLI on your system. You can download an install script that runs the install commands for you, or you can execute the install commands yourself in a step-by-step process. Both methods are provided here:

### Option 1: Install with one command

The easiest way to install the Azure CLI is through a script maintained by the Azure CLI team. This script runs all installation commands in one step. This script is downloaded via curl and piped directly to bash to install the CLI.

If you wish to inspect the contents of the script yourself before executing, download the script first using curl and inspect it in your favorite text editor.

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```
