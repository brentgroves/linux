# install mysql client

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

You could also skip this and install the mysql-shell which is more advanced.

## references

<https://dev.mysql.com/doc/refman/8.0/en/mysql.html>

<https://www.bytebase.com/blog/how-to-install-mysql-client-on-mac-ubuntu-centos-windows/>

<https://virtual-dba.com/blog/how-to-use-mysql-config-editor/>

## install mysql client only

```bash
sudo apt install mysql-client
```

## configure defaults

```bash
mysql_config_editor print --all
mysql_config_editor set --login-path=client --host=172.20.88.61 --port=30031 --user=root --password
mysql_config_editor set --login-path=client --host=172.20.1.190 --port=31008 --user=root --password
mysql -u root -p -h 10.1.0.118 --port=31008
mysql -u root -p -h reports31 --port=30031
```

## login issue

If you are using the conda reports environment it has openssl 1.1 which wont work

```bash
conda activate base
openssl version  
```
