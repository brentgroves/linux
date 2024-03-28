# **[Hostname from IP](https://www.baeldung.com/linux/hostname-from-ip-address)**

## Get the Hostname from a Public IP Address
In the case when the host has a public IP address and a valid reverse DNS entry, we can use the commands host or dig.

2.1. Using the Command host
The host command performs DNS lookups to convert names to IP addresses and vice versa.

Let’s try an example:

```bash
$ host 8.8.8.8
8.8.8.8.in-addr.arpa domain name pointer dns.google.

host 172.20.1.34
34.1.20.172.in-addr.arpa domain name pointer qnap-avi.
```
