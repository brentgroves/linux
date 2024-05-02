# soapui

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

<https://www.soapui.org/getting-started/installing-soapui/installing-on-linux-or-unix/>

```bash
# install needed package
sudo apt install libcanberra-gtk-module

# Installation
# Download the install script from http://www.soapui.org/
cd ~/Downloads/
chmod +x SoapUI-x64-5.7.2.sh
./SoapUI-x64-5.7.2.sh

# install projects
cd ~/src
git clone git@github.com:brentgroves/PlexSoapUI.git 
# remove old projects
rm ~/soapui/*
# import projects
# Import project PlexSoapProd-soapui-project.xml and PlexSoapTest-soapui-project.xml from repository     
```
