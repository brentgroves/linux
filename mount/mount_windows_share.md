# **[Mount Windows share permanately](https://wiki.ubuntu.com/MountWindowsSharesPermanently)**

## CIFS installation

```bash
sudo apt-get install cifs-utils
```

## Mounting unprotected (guest) network folders
First, let's create the mount directory. You will need a separate directory for each mount.

```bash
sudo mkdir /media/windowsshare
```

Then edit your /etc/fstab file (with root privileges) to add this line:

```text
//servername/sharename  /media/windowsshare  cifs  guest,uid=1000,iocharset=utf8  0  0
```

- Where guest indicates you don't need a password to access the share,
- uid=1000 makes the Linux user specified by the id the owner of the mounted share, allowing them to rename files,
- iocharset=utf8 allows access to files with names in non-English languages. This doesn't work with shares of devices like the Buffalo Tera Station, or Windows machines that export their shares using ISO8895-15.

If there is any space in the server path, you need to replace it by \040, for example //servername/My\040Documents

After you add the entry to /etc/fstab type:

```bash
sudo mount -a
```
This will (re)mount all entries listed in /etc/fstab.

## Mount password protected network folders

The quickest way to auto-mounting a password-protected share is to edit /etc/fstab (with root privileges), to add this line:

```text
//servername/sharename  /media/windowsshare  cifs  username=msusername,password=mspassword,iocharset=utf8  0  0
```

This is not a good idea however: /etc/fstab is readable by everyone and so is your Windows password in it. The way around this is to use a credentials file. This is a file that contains just the username and password.

Using a text editor, create a file for your remote servers logon credential:

```bash
gedit ~/.smbcredentials
```

Enter your Windows username and password in the file:
```text
username=msusername
password=mspassword
```

Save the file, exit the editor.
Change the permissions of the file to prevent unwanted access to your credentials:

Save the file, exit the editor.
Finally, test the fstab entry by issuing:

```bash
sudo mount -a
```

If there are no errors, you should test how it works after a reboot. Your remote share should mount automatically.

```bash
chmod 600 ~/.smbcredentials
```

Then edit your /etc/fstab file (with root privileges) to add this line (replacing the insecure line in the example above, if you added it):

```text
//servername/sharename /media/windowsshare cifs credentials=/home/ubuntuusername/.smbcredentials,iocharset=utf8 0 0 
```

