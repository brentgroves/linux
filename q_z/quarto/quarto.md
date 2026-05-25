# Quarto

```bash
cd ~/Downloads
curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.37/quarto-1.9.37-linux-amd64.deb
# permission error with apt
# sudo apt install ./quarto-1.9.37-linux-amd64.deb
sudo dpkg -i ./quarto-1.9.37-linux-amd64.deb

sudo apt remove