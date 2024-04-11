# install free pascal

## reference

<https://www.freepascal.org/docs-html/3.0.2/user/user.html#QQ2-11-15>
<https://www.freepascal.org/docs-html/3.0.2/user/usersu5.html>

## **[download free pascal](https://sourceforge.net/projects/freepascal/files/latest/download)**

```bash
# Don't use did not work!!!
sudo apt install fp-compiler-3.2.2
```

```bash
cd ~/Downloads
curl -LO https://sourceforge.net/projects/freepascal/files/latest/download
tar -xvf fpc-3.2.0-x86_64-linux.tar 
cd fpc-3.2.0-x86_64-linux
./install.sh
# install to /home/brent/fpc-3.2.0
# Added export PATH="/home/brent/fpc-3.2.0/bin:$PATH" to exports.sh
```

And then you must answer some questions. They’re very simple, they’re mainly concerned with 2 things :

Places where you can install different things.
Deciding if you want to install certain components (such as sources and demo programs).
The script will automatically detect which components are present and can be installed. It will only offer to install what has been found. Because of this feature, you must keep the original names when downloading, since the script expects this.
If you run the installation script as the root user, you can just accept all installation defaults. If you don’t run as root, you must take care to supply the installation program with directory names where you have write permission, as it will attempt to create the directories you specify. In principle, you can install it wherever you want, though.
At the end of installation, the installation program will generate a configuration file (fpc.cfg) for the Free Pascal compiler which reflects the settings that you chose. It will install this file in the /etc directory or in your home directory (with name .fpc.cfg) if you do not have write permission in the /etc directory. It will make a copy in the directory where you installed the libraries.
The compiler will first look for a file .fpc.cfg in your home directory before looking in the /etc directory.

/home/brent/fpc-3.2.0
