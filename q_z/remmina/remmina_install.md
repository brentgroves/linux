# Remmina Install

## references

<https://www.how2shout.com/linux/4-ways-to-install-remmina-on-ubuntu-22-04-lts-jammy-jellyfish/>
<https://devanswe.rs/how-to-fix-authentication-is-required-to-create-a-color-profile-managed-device-on-ubuntu-20-04-20-10/>

## Install remmina

```bash
sudo add-apt-repository ppa:remmina-ppa-team/remmina-next
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice

# Run Remmina on Ubuntu 22.04

# We can access the remote desktop using Remmina. Go to Application launcher and search for it. As you see the app icon, click to run the same.
```

## **[Import remmina desktop files](https://askubuntu.com/questions/420986/copy-or-export-remmina-remote-desktop-files-to-another-ubuntu-install)**

```bash
cd ~/src
git clone git@github.com:brentgroves/remmina.git
cd remmina
rm ~/.local/share/remmina/*
mkdir -p ~/.local/share/remmina
cp * ~/.local/share/remmina  
# Thank you Father for this work.
You may have to reenter the password
```

```bash
# to update github repo:
cd ~/src/remmina
rm *
cp ~/.local/share/remmina/* .
git add -A
git commit -m "updated"
git push -u origin main
```
