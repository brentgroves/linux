# Mount SMB devices

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## references
<https://documentation.ubuntu.com/server/how-to/samba/mount-cifs-shares-permanently/>

TW9iZXhHbG9iYWxOQVMyMDIyIQ==
<https://support.zadarastorage.com/hc/en-us/articles/213024986-How-to-Mount-a-SMB-Share-in-Ubuntu>
<https://linuxize.com/post/how-to-mount-cifs-windows-share-on-linux/>
mongodump mongodb://adminuser:password123@reports11:30311 --out /home/brent/backups/mongo

```bash
sudo apt-get install cifs-utils
sudo mkdir /mnt/pd-avi-vfs1
sudo chmod 777 /mnt/pd-avi-vfs1
sudo umount -l /mnt/pd-avi-vfs1
vi ~/.smbcredentials
sudo mount -t cifs -o credentials=/home/brent/.smbcredentials '//pd-avi-vfs1/Indiana Data/Public' /mnt/pd-avi-vfs1

sudo mount -t cifs -o uid=<linuxuser>,username=<serveruser>,dom=<serverdomain> //server/folder /local/folder/ uid to be able to write to the folders; dom to provide the correct domain name;

sudo mkdir /mnt/qnap_avi
sudo chmod 777 /mnt/qnap_avi
sudo umount -l /mnt/qnap_avi
sudo vi /etc/qnap-credentials
sudo mount -t cifs -o username=admin,dir_mode=0777,file_mode=0777,password=TW9iZXhHbG9iYWxOQVMyMDIyIQ== //172.20.1.34/home /mnt/qnap_avi 
sudo mount -t cifs -o username=admin,dir_mode=0777,file_mode=0777,password=TW9iZXhHbG9iYWxOQVMyMDIyIQ== //qnap-avi/home /mnt/qnap_avi 
# use this one
sudo mount -t cifs -o credentials=/etc/qnap-credentials,dir_mode=0777,file_mode=0777 //qnap-avi/home /mnt/qnap_avi 
sudo umount -l /mnt/qnap_avi

\\pd-avi-vfs1\Indiana Data\Public\

```

/etc/fstab

# <file system>             <dir>          <type> <options>                                                   <dump>  <pass>

//WIN_SHARE_IP/share_name  /mnt/win_share  cifs  credentials=/etc/win-credentials,file_mode=0755,dir_mode=0755 0       0
//qnap-avi/home /mnt/qnap_avi cifs  credentials=/etc/qnap-credentials,dir_mode=0777,file_mode=0777  0 0

sudo mount /mnt/qnap_avi
//qnap-avi/home /mnt/qnap_avi cifs  credentials=/etc/qnap-credentials,dir_mode=0777,file_mode=0777  0 0
