# Install Chrome

<https://linuxconfig.org/how-to-install-google-chrome-web-browser-on-ubuntu-22-04-jammy-jellyfish>

```bash
# First, use the wget command to download the Google Chrome installer.
cd ~/Downloads 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Then, we can use the apt command and root permissions to install Google Chrome.
sudo dpkg -i google-chrome-stable_current_amd64.deb
# got a permission error when installing the .deb file with apt so use dpkg instead.

# You will now find Google Chrome accessible under the Activities menu. Just search for it by typing “chrome.” You can right click this icon and add it to your quick launch bar if you want.
