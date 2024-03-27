# Install dotfiles

## new error

```bash
# old .fzf.zsh works
cat ~/.fzf.zsh
# Setup fzf
# ---------
if [[ ! "$PATH" == */home/brent/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/brent/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/brent/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/brent/.fzf/shell/key-bindings.zsh"

# new .fzf.zsh fails at eval "$(fzf --zsh)"
(base)  brent@reports-alb cat ~/.fzf.zsh
# ---------
if [[ ! "$PATH" == */home/brent/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/brent/.fzf/bin"
fi

eval "$(fzf --zsh)"
```

### fix

the error happened when we ran "fzf --zsh" so I did the following

```bash
sudo apt uninstall fzf
rm -rf ~/.fzf
rm ~/.fzf.zsh
sudo apt install fzf
# left fzf reference in .zshrc alone "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh"

```

## end new error notes

## start dotfile installation

```bash
cd ~
git clone git@github.com:brentgroves/dotfiles.git
sudo apt-get install zsh-antigen neofetch fzf fonts-powerline
# do not install tmux or nvim now
cd ~/dotfiles
./deploy
# dont install tmux or vim now
# restart terminal
cd ~/dotfiles
rm ~/.zshrc
cp .zshrc-miniconda ~/.zshrc

# logout and login
If the prompt does not appear do the following:
1. vi ~/dotfiles/zsh/.antigenrc
2. Uncomment robbyrussel theme in ~/dotfiles/zsh/.antigenrc and comment out the agnoster  theme
3. logout and log back in
4. Open command prompt
You should now see the prompt from the robbyrussel theme.
5. vi ~/dotfiles/zsh/.antigenrc
6. Comment out the robbyrussel theme in ~/dotfiles/zsh/.antigenrc and uncomment the agnoster  theme.
7. Reopen command prompt   
```
