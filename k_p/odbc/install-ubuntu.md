# ODBC Install

```bash
# From a stackoverflow question:
# "When SQL Server gets installed it is configured with a self-signed X.509 certificate. If you want to use encrypted connections (with Encrypt=yes; in the connection string, which is the default now) you'll either need to 1) get the X.509 certificate's public key from the server and add it to your trusted certificates store on the client or 2) use the TrustServerCertificate=yes; setting in your connection string."
# In addition to adding TrustServerCertificate=yes; to the connection string I had to lower the default security level from 2 to 0.

sudo vi /etc/ssl/openssl.cnf
# # this is for driver 18 not 17
# [system_default_sect]
# # CipherString = DEFAULT:@SECLEVEL=2
# CipherString = DEFAULT:@SECLEVEL=0



# <https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16>

sudo apt update
sudo apt install build-essential -y
sudo su
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list
# deb [arch=amd64,armhf,arm64] https://packages.microsoft.com/ubuntu/21.04/prod hirsute main
# deb [arch=amd64,armhf,arm64] https://packages.microsoft.com/ubuntu/22.04/prod jammy main
cat /etc/apt/sources.list.d/mssql-release.list

exit
sudo apt update
DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y sudo apt-get install -y msodbcsql17
DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y sudo apt-get install -y mssql-tools
DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y sudo apt-get install -y msodbcsql18
DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y sudo apt-get install -y mssql-tools18
sudo apt install -y unixodbc-dev

verify if unixODBC is installed
which odbcinst
which isql

# My dotfiles has this in the path already.
# echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
# source ~/.bashrc

cd ~/src/repsys/linux/odbc
# Dont need to extract driver
# tar -xf PROGRESS_DATADIRECT_OPENACCESS_OAODBC_8.1.0.HOTFIX_LINUX_64.tar
# install ksh already installed in 22.04 desktop
sudo su
ksh unixpi.ksh  
# Press the space bar around 50 times to get through the license.
# Install will ask you for the following which I got from the linux drivers from Plex. (NAME/KEY = 35057920,COMPANY = BPG-IN,SERIAL = 004193623)
# This is how the docker file does it.
# message = '\nYES\n\n\n35057920\nBPG-IN\n004193623\n35057920\n\n'
# run( [ 'ksh', 'unixpi.ksh' ], input=message.encode() )
# OUTPUT
-------------------------------------------------------------------
--------------------- Information entered -------------------------
-------------------------------------------------------------------
Name          :35057920
Company       :BPG-IN
Serial Number :004193623
Key           :35057920
-------------------------------------------------------------------
You have chosen the OpenAccess driver.
To change this information, enter C. Otherwise, press Enter to continue. :
Please wait while the product is installing...
Creating license file......
The installer has successfully created an ODBCINI-file.
Your DataDirect OpenAccess SDK Client for ODBC installation was successful.
You must set up the environment for each user.
If you are using the Korn or Bourne shell,
 execute: . oaodbc64.sh
If you are using the C shell,
 execute: source oaodbc64.csh
These shell scripts can be found in the installation directory.
The product installation has completed successfully.
# exit out of root.
exit
# then update the /etc/odbc.ini and /usr/oaodbc81/odbc64.ini files with what is stored in the ETL-Pod dockerfile
cd ~/src/repsys/linux/odbc
sudo cp ./odbc.ini /etc/
cat /etc/odbc.ini
# odbc64.ini already had stuff in it but i deleted it and copied the file in this directory
# which contained the original content plus Plex and PlexTest entries.
sudo rm /usr/oaodbc81/odbc64.ini
sudo cp ./odbc64.ini /usr/oaodbc81/
cat /usr/oaodbc81/odbc64.ini
# The environment variables need to be set before any connection will work.
# The docker file does this:
# ENV LD_LIBRARY_PATH="/usr/oaodbc81/lib64"
# ENV OASDK_ODBC_HOME="/usr/oaodbc81/lib64"
# ENV ODBCINI="/usr/oaodbc81/odbc64.ini"
# But these entries are already set in my dotfile.
# You can:
# source oaodbc64.sh script which exports common unixODBC environmental variables if the dotfiles have
# not been installed yet.  
# run odbcinst -j to verify the environmental variables were set.
# Should look like this:
# unixODBC 2.3.9
# DRIVERS............: /etc/odbcinst.ini
# SYSTEM DATA SOURCES: /etc/odbc.ini
# FILE DATA SOURCES..: /etc/ODBCDataSources
# USER DATA SOURCES..: /usr/oaodbc81/odbc64.ini
# SQLULEN Size.......: 8
# SQLLEN Size........: 8
# SQLSETPOSIROW Size.: 8

cd ~/src/repsys/linux/conda
conda env create -f env-reports.yml
conda activate reports
# pyodbc issue
# when running:python odbc-dsn-plextest.py from
# /home/brent/src/repsys/odbc
# would get a segmentation fault when using pyodbc installed with conda
# to fix the issue i ran: conda remove pyodbc
# then checked pip list:
# if pyodbc was not installed then I ran: pip install pyodbc.
# after this running:python odbc-dsn-plextest.py caused no errors.
conda remove pyodbc
pip install pyodbc
# Successfully installed pyodbc-5.1.0
cd ~/src/repsys/linux/odbc
# verify connection is ok.  
python odbc-dsn-plextest.py
3675

# did not get cm-connect.py to work
```

## Some notes

### **[pyodbc issue](https://stackoverflow.com/questions/71688125/odbc-driver-18-for-sql-serverssl-provider-error1416f086)**

when running:python odbc-dsn-plextest.py from
/home/brent/src/repsys/linux/odbc
would get a segmentation fault when using pyodbc installed with conda
to fix the issue i ran: conda remove pyodbc
then checked pip list:
if pyodbc was not installed then I ran: pip install pyodbc.
after this running:python odbc-dsn-plextest.py caused no errors.

### references

<https://stackoverflow.com/questions/74708033/error-code-0x2746-10054-when-trying-to-connect-to-sql-server-2014-via-odbc-fro>
<https://askubuntu.com/questions/1233186/ubuntu-20-04-how-to-set-lower-ssl-security-level>

was having the same problem trying to connect from PHP 8.1 in a Ubuntu 22.04 server to a Microsoft SQL Server 2014.

OpenSSL 3.0 (which comes with Ubuntu 22.04) changed the default behaviour of SECLEVEL. Now you need to specify 0 instead of 1. More info here: <https://github.com/openssl/openssl/issues/17476>

Two different things fixed the problem for me:
As explained above, in /etc/ssl/openssl.cnf
Change:
[system_default_sect] CipherString = DEFAULT:@SECLEVEL=2
To:
[system_default_sect] CipherString = DEFAULT:@SECLEVEL=0

Also, when establishing the connection in PHP (and I imagine the same would work in Python too) to the SQL server, add the following options:

"Encrypt"=>true, "TrustServerCertificate"=>true

## notes

```bash
# Don't need to extract this
tar -xf PROGRESS_DATADIRECT_OPENACCESS_OAODBC_8.1.0.HOTFIX_LINUX_64.tar
```
