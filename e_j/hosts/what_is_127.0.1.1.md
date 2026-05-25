# **[what is 127.0.1.1](https://serverfault.com/questions/363095/why-does-my-hostname-appear-with-the-address-127-0-1-1-rather-than-127-0-0-1-in)**

There isn't a great deal of difference between the two; 127/8 (eg: 127.0.0.0 => 127.255.255.255) are all bound to the loopback interface.

The reason why is documented in the Debian manual in **[Ch. 5 Network Setup - 5.1.1.](http://www.debian.org/doc/manuals/debian-reference/ch05.en.html#_the_hostname_resolution)** The hostname resolution.

Ultimately, it is a bug workaround; the original report is 316099.
