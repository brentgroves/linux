# Install NeoVim

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## Add universe repo for appimage to work

```bash
# <https://github.com/AppImage/AppImageKit/wiki/FUSE>
sudo add-apt-repository universe

sudo apt install build-essential xclip libfuse2 xsel

# Needed for copy/paste to system clipboard using “+y in nvim
# Neovim
# <https://github.com/neovim/neovim/wiki/Installing-Neovim>
# The version in ubuntu is way to old.
```

```bash
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
sudo install -m 755 nvim-linux-x86_64.appimage /usr/local/bin/nvim

mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
echo 'so /home/brent/dotfiles/nvim/init.vim' > ~/.config/nvim/init.vim
# or if multipass vm
echo 'so /home/ubuntu/dotfiles/nvim/init.vim' > ~/.config/nvim/init.vim

# echo 'so ~/dotfiles/nvim/init.vim' > ~/.config/nvim/init.vim

# -- Install vim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Start nvim you will see errors.
nvim
# if error
# AppImages require FUSE to run. 
# You might still be able to extract the contents of this AppImage 
# if you run it with the --appimage-extract option. 
# See https://github.com/AppImage/AppImageKit/wiki/FUSE 

sudo add-apt-repository universe
sudo apt install libfuse2t64

:checkhealth
:PlugInstall
# getting this error now when running pluginstall
x Post-update hook for vim-prettier ... Exit status: 1
# install could take a while but be patient it is hard to tell that it is actually installing stuff.
nvim
# needs fzf version 0.60.3 which is currently found in github
sudo apt remove fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
https://github.com/junegunn/fzf/blob/master/install
:checkhealth
# Everything ok now.

# <https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim>


```
