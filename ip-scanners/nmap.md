<https://nmap.org/book/port-scanning-tutorial.html>
<https://www.techrepublic.com/article/how-to-scan-for-ip-addresses-on-your-network-with-linux/>
sudo snap install nmap
sudo apt-get install nmap -y

Once the installation completes, you are ready to scan your LAN with nmap. To find out what addresses are in use, issue the command:

nmap -sP 172.20.88.0/22
nmap -sP 10.1.0.0/22
nmap 172.20.88.115
<https://172.20.88.115-118>

Note: You will need to alter the IP address scheme to match yours.

The output of the command (Figure B), will show you each address found on your LAN.

sudo nmap -vv -sS -O -n 172.20.88.0/22

While this simple command is often all that is needed, advanced users often go much further. In Example 4.3, the scan is modified with four options. -p0- asks Nmap to scan every possible TCP port, -v asks Nmap to be verbose about it, -A enables aggressive tests such as remote OS detection, service/version detection, and the Nmap Scripting Engine (NSE). Finally, -T4 enables a more aggressive timing policy to speed up the scan.

nmap p0- -v -A -T4 172.20.88.115

## locate dhcp server

sudo nmap --script broadcast-dhcp-discover -e enp0s25
Starting Nmap 7.80 ( <https://nmap.org> ) at 2024-03-06 12:31 EST
Pre-scan script results:
| broadcast-dhcp-discover:
|   Response 1 of 1:
|     IP Offered: 10.1.2.127
|     DHCP Message Type: DHCPOFFER
|     Subnet Mask: 255.255.252.0
|     Renewal Time Value: 0s
|     Rebinding Time Value: 0s
|     IP Address Lease Time: 1s
|     Server Identifier: 10.1.2.69
|     Router: 10.1.1.205
|     Domain Name Server: 10.1.2.69, 10.1.2.70, 172.20.0.39
|     Domain Name: BUSCHE-CNC.COM\x00
|_    TFTP Server Name: mgavi-srv-wds.busche-cnc.com\x00
WARNING: No targets were specified, so 0 hosts scanned.
Nmap done: 0 IP addresses (0 hosts up) scanned in 0.77 seconds
