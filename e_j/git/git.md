# Install git

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## reference

- **[diff between git@github.com and https://githbu.com](https://stackoverflow.com/questions/40659168/difference-between-gitgithub-com-and-https-github-com)**
8

git can operate on a variety of different protocols

http(s) like <https://github.com/project/repo.git>

It uses the port 443 (or 80 for http), it allows both read and write access, password for auth (like on github it allows anonymous read access but asks a paasword for write).and Firewall friendly (it does not require any infra configuration).

ssh like <git@github.com>:project/repo.git

It uses the port 22, it allows both read and write access, requires SSH Keys for auth so if you give git your public ssh key, your ssh protocol will use your private key for authentication with git, so you will not need to provide a username password.

with SSH you will not be asked to provide your password each time you use the git push command as the ssh protocol will use you private key for authentication with the repository.

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

# Step 3: Change the default branch from master to main

git config --global init.defaultBranch main
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

### **[add certificate to trust store](https://fabianlee.org/2019/01/28/git-client-error-server-certificate-verification-failed/)**

```bash
git clone https://github.com/barnybug/cli53
Cloning into 'cli53'...
fatal: unable to access 'https://github.com/barnybug/cli53/': server certificate verification failed. CAfile: none CRLfile: none

# this reverts back to the original /etc/ssl/certs/ca-certificates.crt
# sudo update-ca-certificates

openssl s_client -showcerts -servername github.com -connect github.com:443 </dev/null 2>/dev/null | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p'  > github-com.pem
cat github-com.pem | sudo tee -a /etc/ssl/certs/ca-certificates.crt
```

### bypass ssl verification

Not recommended

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

git config --global --unset http.sslverify 

```
