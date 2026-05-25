# **[python install](https://phoenixnap.com/kb/how-to-install-python-3-ubuntu)**

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## Uninstall **[Conda](https://www.anaconda.com/docs/getting-started/miniconda/uninstall)**

`~/miniconda3/uninstall.sh`

## Commands to install Python

Step 1: Update the Package Repository
Update the package repository to ensure you get the latest available program version. Run the following command:

```bash
sudo apt update
```

m
Step 2: Install Python
After the package repository information is updated, run the command below to install Python:

```bash
sudo apt install python3
```

Step 3: Verify Installation
Verify whether the installation was successful by checking the program version:

```bash

which python3
/bin/python3
realpath /bin/python3
/usr/bin/python3.12

python3 --version
Python 3.12.3
sudo su

which python3
/usr/bin/python3
realpath /usr/bin/python3
/usr/bin/python3.12


```
