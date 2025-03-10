# Install git

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

<https://linuxhint.com/install-git-ubuntu22-04/>

```bash
# Step 1: Update the system
# Before installing Git make sure your system is up to date. To verify this use the following commands.

sudo apt update -yq | sudo apt upgrade -yq
sudo apt install git
git --version

# Step 1: Provide a username
# Use the command given below to provide a username
# Pick only one user.name, user.email
git config --global user.name "cstangland"
git config --global user.name "bcieslik"
git config --global user.name "bcook"
git config --global user.name "sjackson"
git config --global user.name "jdavis"
git config --global user.name "kyoung"
git config --global user.name "brentgroves"

# Step 2: Provide an email address
# The email address is provided using this command.

git config --global user.email "cstangland@mobexglobal.com"
git config --global user.email "bcieslik@mobexglobal.com"
git config --global user.email "bcook@mobexglobal.com"
git config --global user.email "sjackson@mobexglobal.com"
git config --global user.email "jdavis@mobexglobal.com"
git config --global user.email "kyoung@mobexglobal.com"
git config --global user.email "brent.groves@gmail.com"
git config --global core.editor "nano"


```

## **[Setup user for SSH access to use Azure Dev Ops](./ssh-azure.md)**

## **[Setup user for SSH access to use GitHub](./ssh-github.md)**

## Trouble-Shooting

### AI why does server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt

The error "server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt" means that your system cannot verify the authenticity of the server's SSL certificate because it is either expired, self-signed, or issued by a Certificate Authority (CA) that is not trusted by your system's list of known CAs, which is stored in the file /etc/ssl/certs/ca-certificates.crt.
Key reasons for this error:
Outdated CA certificates:
The most common cause is that your system's list of trusted CAs is not up-to-date, meaning the server's certificate might be signed by a CA that is no longer considered reliable.
Expired certificate:
The server's SSL certificate might have expired.
Self-signed certificate:
The server might be using a self-signed certificate, which is not trusted by default unless explicitly added to your system's trusted CA list.
Mismatched hostname:
The server's certificate might not match the hostname you are trying to access.
Network issues:
In some cases, network issues like a proxy could interfere with certificate verification

### bypass ssl verification

```bash
ssh brent@10.188.50.202
git clone https://github.com/barnybug/cli53
git clone https://github.com/w3schools-test/w3schools-test.github.io.git
Cloning into 'w3schools-test.github.io'...
fatal: unable to access 'https://github.com/w3schools-test/w3schools-test.github.io.git/': server certificate verification failed. CAfile: none CRLfile: none

You can also disable SSL verification, (if the project does not require a high level of security other than login/password) by typing :

sudo timedatectl set-timezone America/Indiana/Indianapolis
sudo timedatectl
               Local time: Mon 2025-03-10 18:35:50 EDT
           Universal time: Mon 2025-03-10 22:35:50 UTC
                 RTC time: Mon 2025-03-10 22:35:50
                Time zone: America/Indiana/Indianapolis (EDT, -0400)
System clock synchronized: no
              NTP service: active
          RTC in local TZ: no

git config --global --get http.sslverify 


git config --global http.sslverify false
```

### configure git to use local trust store

<https://git-scm.com/docs/git-config>

```bash
2016: Make sure first that you have certificates installed on your Debian in /etc/ssl/certs.

If not, reinstall them:

sudo apt-get install --reinstall ca-certificates
Since that package does not include root certificates, add:

sudo update-ca-certificates
Make sure your git does reference those CA:

git config --global --get http.sslCAinfo

git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt

git config --global --get http.sslCAPath

git config --global http.sslCAPath /etc/ssl/certs/

http.sslCAPath

Since that package does not include root certificates, add:

sudo mkdir /usr/local/share/ca-certificates/cacert.org
sudo wget -P ~/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt

sudo wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt
sudo update-ca-certificates
Make sure your git does reference those CA:

git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt


```

http.sslVerify
Whether to verify the SSL certificate when fetching or pushing over HTTPS. Defaults to true. Can be overridden by the GIT_SSL_NO_VERIFY environment variable.

http.sslCert
File containing the SSL certificate when fetching or pushing over HTTPS. Can be overridden by the GIT_SSL_CERT environment variable.

http.sslKey
File containing the SSL private key when fetching or pushing over HTTPS. Can be overridden by the GIT_SSL_KEY environment variable.

http.sslCertPasswordProtected
Enable Git’s password prompt for the SSL certificate. Otherwise OpenSSL will prompt the user, possibly many times, if the certificate or private key is encrypted. Can be overridden by the GIT_SSL_CERT_PASSWORD_PROTECTED environment variable.

http.sslCAInfo
File containing the certificates to verify the peer with when fetching or pushing over HTTPS. Can be overridden by the GIT_SSL_CAINFO environment variable.

http.sslCAPath
Path containing files with the CA certificates to verify the peer with when fetching or pushing over HTTPS. Can be overridden by the GIT_SSL_CAPATH environment variable.
