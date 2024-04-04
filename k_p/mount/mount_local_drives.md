# **[Mount](https://www.zdnet.com/article/how-to-permanently-mount-a-drive-in-linux-and-why-you-should/)**

## How to automount a drive in Linux
What you'll need: To make this work, you'll need a running instance of Linux, a secondary drive plugged into your machine, and a user with sudo privileges. I'll demonstrate with Pop!_OS Linux but the process should be the same, regardless of which distribution you use. I will also assume the drive has been formatted. I always format my secondary Linux drives with the ext4 format.

1. Locate the name of your drive
The first thing to be done is to locate the name of the drive to be mounted. Here's a simple way to find the name.

Also: Can't remember the Linux command you ran earlier? Let history repeat itself

Without the drive plugged in, issue the following command:

```bash
lsblk
# In the output of that command, you should see entries like this:
sda             8:0    0 931.5G  0 disk  
ââsda1          8:1    0 931.5G  0 part

# Plug the drive in and run the command again and you'll see a new entry like:

sdb             8:16   0 931.5G  0 disk  
ââsdb1          8:17   0 931.5G  0 part
```
If you can't easily unplug the secondary disk, just run the lsblk command. If you see two drives, sda and sdb, chances are very good your secondary drive is sdb. For the purpose of showing this process, we'll assume the name of your drive is /dev/sdb.

## 2. Create a mount point
The mount point will be the directory on your primary drive that will serve as a location you will access the secondary drive from. 

Also: The most important reason you should be using Linux at home

This doesn't copy or move the files from one to the other but, rather, creates a place for the operating system to "mount" the secondary drive. Let's create a mount point called /data with the command:

sudo mkdir /data
Next, change the ownership of the new directory to your user with the command:

sudo chown -R $USER:$USER /data
The -R option makes sure all child folders have the same ownership.

## 3. Create an entry in /etc/fstab
The /etc/fstab is the file responsible for mapping the secondary drive to the mount point. 

Also: 8 things you can do with Linux that you can't do with MacOS or Windows 

Assuming the name of your secondary drive is /dev/sdb, we'll tack on a 1 to the end (because /dev/sdb1 is the first usable partition). Open the fstab file for editing with the command:

```bash
sudo nano /etc/fstab
# At the bottom of that file, add an entry like this:

# /dev/sdb1 /data    ext4    defaults        0       0
# Here's an explanation:

# /dev/sdb1 -- the secondary drive
# /data -- the mount point
# ext4 -- the secondary drive file system type.
# defaults -- uses the default options
# 0 0 -- these fields are for dump and fsck. Just leave them both as zeros
# Save and close the file with Ctrl-X.

# qnap-avi example
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation
/dev/disk/by-id/dm-uuid-LVM-idvWHGMs2qtZTL7ce0zVlcn8l7EoH13gw7epIOCKECsgMdRzq8bNUl69EaGnTPVy / ext4 defaults 0 1
# /boot was on /dev/sda2 during curtin installation
/dev/disk/by-uuid/5aef2d2b-9166-4ecd-901c-5c86e63d363a /boot ext4 defaults 0 1
/swap.img       none    swap    sw      0       0
//qnap-avi/home /mnt/qnap_avi cifs  credentials=/etc/qnap-credentials,dir_mode=0777,file_mode=0777  0 0

```

## Testing the mount
All you need to do to test the mount is issue the command:

```bash
mount -a
```
If you receive no feedback, everything is good. You can now reboot your machine and the secondary drive will be automatically mounted so you can access the files from /data.