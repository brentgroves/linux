# Studio 3t install

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## references

<https://studio3t.com/knowledge-base/articles/how-to-install-studio-3t-on-linux/>

<https://www.how2shout.com/linux/how-to-install-robo-3t-on-ubuntu-22-04-lts-jammy-linux/#Steps_to_install_Robo_3T_or_Studio_3T_free_on_Ubuntu_2204>

## Install Studio 3t

```bash
cd Downloads
had to goto the website to download this file.
# wget dont work today
wget https://studio3t.com/download/studio-3t-linux-x64.tar.gz
# must use a browser now can't just use wget
# https://studio3t.com/download
tar -xvf studio-3t-linux-x64.tar.gz
sudo chmod +x studio-3t-linux-x64.sh
# Installation requires a studio 3t account. I used my google account for IAM.
./studio-3t-linux-x64.sh
mongodb://adminuser:password123@reports31:30331/databaseName?authSource=admin
```
