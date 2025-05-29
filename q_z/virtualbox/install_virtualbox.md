# **[Install virtualbox](https://linuxiac.com/how-to-install-virtualbox-on-ubuntu-24-04-lts/)**

## Step 1: Import VirtualBox’s Repo GPG Key

First, we’ll import the GPG key from the VirtualBox repository to ensure the authenticity of the software we install from it.

```bash
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
```

![i1](https://cdn.shortpixel.ai/spai/q_lossy+ret_img+to_auto/linuxiac.com/wp-content/uploads/2024/05/vbox-ubuntu2404-01.jpg)

## Step 2: Add VirtualBox Repository

Next, we’ll add the official VirtualBox repository to our Ubuntu 22.04 system. If a new version is released, the update package will be made available with the rest of your system’s regular updates.

```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] <http://download.virtualbox.org/virtualbox/debian> $(. /etc/os-release && echo "$VERSION_CODENAME") contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```

![i2](https://linuxiac.com/wp-content/uploads/2024/05/vbox-ubuntu2404-02.jpg)

## Step 3: Run System Update

Before we proceed with VirtualBox installation on our Ubuntu 24.04 system, we should refresh the list of available packages. Run the below command to update the APT repositories index.

`sudo apt update`

![i3](https://cdn.shortpixel.ai/spai/q_lossy+ret_img+to_auto/linuxiac.com/wp-content/uploads/2024/05/vbox-ubuntu2404-03-1024x371.jpg)

## Step 4: Install VirtualBox 7.1 on Ubuntu 24.04 LTS

We’re all set to install VirtualBox on our Ubuntu 24.04 system. Run the following commands:

`sudo apt install virtualbox-7.1`

## Step 5: Install VirtualBox Extension Pack

This is an optional step, but I strongly encourage it because it will make working with VirtualBox on your Ubuntu system easier and more convenient. VirtualBox Extension Pack unlocks many great features, such as:

USB 2 and USB 3 support
VirtualBox Remote Desktop Protocol (VRDP)
Host webcam passthrough
Disk image encryption with AES algorithm
Intel PXE boot ROM
Support for NVMe SSDs
Let’s highlight one peculiarity here. The Extension Pack’s version is strongly recommended to match the VirtualBox’s installed version. To verify the exact one of the just-installed VirtualBox, you can use a built-in vboxmanage command:

`vboxmanage -v | cut -dr -f1`

![i4](https://cdn.shortpixel.ai/spai/q_lossy+ret_img+to_auto/linuxiac.com/wp-content/uploads/2024/05/vbox-ubuntu2404-101.jpg)

As you can see, the installed version of VirtualBox is “7.1.0.” Therefore, you must then download the Extension Pack with the same version. So, use the below wget command to download the appropriate Extension Pack for VirtualBox.

However, if your installation is different, replace both places containing “7.1.0” in the command below with the appropriate version. You can also visit the downloads page and look at the available versions.

```bash
wget https://download.virtualbox.org/virtualbox/7.1.0/Oracle_VirtualBox_Extension_Pack-7.1.0.vbox-extpack
```

Next, to install the VirtualBox Extension pack, run the vboxmanage command as follows:

```bash
sudo vboxmanage extpack install Oracle_VirtualBox_Extension_Pack-7.1.0.vbox-extpack
```

Additionally, you can verify installed VirtualBox’s extension pack version by running the following:

`vboxmanage list extpacks`

## Step 6: Add User to vboxusers Group

Before using VirtualBox, add your user account to the “vboxusers” group. This is quick and simple to accomplish by running:

```bash
sudo usermod -aG vboxusers $USER
Code language: PHP (php)
# Now, perform a reboot. After login, check that you are in the “vboxusers” group with this command:
groups $USER
```

## Conclusion

Now, with VirtualBox installed on your Ubuntu 24.04 system, you are well equipped with the power to run multiple operating systems and test applications in safe, isolated environments.

However, VirtualBox isn’t the only player in the virtualization game—VMware Workstation is another excellent and reliable option. If you’re thinking about giving it a try, we’ve got you covered with a **[step-by-step guide on setting it up in Ubuntu 24.04LTS](https://linuxiac.com/install-vmware-workstation-on-ubuntu-24-04-lts/)**.

Finally, I recommend checking the **[official documentation](https://www.virtualbox.org/manual/UserManual.html)** for individuals who want to learn more about VirtualBox’s features and how to use them effectively.

I hope this guide has been informative and helpful in getting you started with VirtualBox on Ubuntu. Thanks for your time! Your feedback and comments are most welcome. Happy virtualizing!
