https://www.ssl.com/guide/pem-der-crt-and-cer-x-509-encodings-and-conversions/

View contents of PEM certificate file
openssl x509 -in CERTIFICATE.pem -text -noout 
Convert PEM certificate to DER
openssl x509 -outform der -in CERTIFICATE.pem -out CERTIFICATE.der
Convert PEM certificate with chain of trust to PKCS#7
PKCS#7 (also known as P7B) is a container format for digital certificates that is most often found in Windows and Java server contexts, and usually has the extension .p7b. PKCS#7 files are not used to store private keys. In the example below, -certfile MORE.pem represents a file with chained intermediate and root certificates (such as a .ca-bundle file downloaded from SSL.com).

openssl crl2pkcs7 -nocrl -certfile CERTIFICATE.pem -certfile MORE.pem -out CERTIFICATE.p7b


Convert PEM certificate with chain of trust and private key to PKCS#12
PKCS#12 (also known as PKCS12 or PFX) is a common binary format for storing a certificate chain and private key in a single, encryptable file, and usually have the filename extensions .p12 or .pfx. In the example below, -certfile MORE.pem adds a file with chained intermediate and root certificates (such as a .ca-bundle file downloaded from SSL.com), and -inkey PRIVATEKEY.key adds the private key for CERTIFICATE.crt(the end-entity certificate). Please see this how-to for a more detailed explanation of the command shown.

openssl pkcs12 -export -out CERTIFICATE.pfx -inkey PRIVATEKEY.key -in CERTIFICATE.crt -certfile MORE.crt
After executing the command above you will be prompted to create a password to protect the PKCS#12 file. Remember this password. You will need it to access any certificates and keys stored in the file.

DER
DER (Distinguished Encoding Rules) is a binary encoding for X.509 certificates and private keys. Unlike PEM, DER-encoded files do not contain plain text statements such as -----BEGIN CERTIFICATE-----. DER files are most commonly seen in Java contexts.

DER Filename Extensions
DER-encoded files are usually found with the extensions .der and .cer.

What does a DER-encoded certificate look like?

3082 07fd 3082 05e5 a003 0201 0202 1068
1604 dff3 34f1 71d8 0a73 5599 c141 7230
0d06 092a 8648 86f7 0d01 010b 0500 3072
310b 3009 0603 5504 0613 0255 5331 0e30
0c06 0355 0408 0c05 5465 7861 7331 1030

Common DER Conversions
In the OpenSSL commands below, replace the filenames in ALL CAPS with the actual paths and filenames you are working with.

View contents of DER-encoded certificate file
openssl x509 -inform der -in CERTIFICATE.der -text -noout

Convert DER-encoded certificate with chain of trust and private key to PKCS#12
To convert a DER certificate to PKCS#12 it should first be converted to PEM, then combined with any additional certificates and/or private key as shown above. For a more detailed description of converting DER to PKCS#12, please see this how-to.

One of the most common forms is Distinguished Encoding Rules (DER) encoding of ASN. 1 (Abstract Syntax Notation One). Overall it is a truly binary representation of the encoded data. The other common format is PEM, and which converts the binary encoding into a text readable format.

https://mbed-tls.readthedocs.io/en/latest/kb/cryptography/asn1-key-structures-in-der-and-pem/

ASN.1 key structures in DER and PEM
Introduction
PEM and the ASN.1 structures that are used in saving cryptographic keys and certificates in a portable format are very popular, yet they have not been documented extensively. It is important to understand the structure inside each DER or PEM formatted file, yet this can be challenging to find. Below, we provide this information.

ASN.1 and DER encoding
The RSA, PKCS#1, SSL and TLS communities use the Distinguished Encoding Rules (DER) encoding of ASN.1 to represent keys and certificates in a portable format. The certificate and key information is stored in the binary DER for ASN.1, and applications providing RSA, SSL and TLS should use DER encoding to parse the data. While ASN.1 is a complex representation format and can be difficult to understand, it also has its merits.

PEM files
Because DER encoding results in a truly binary representation of the encoded data, the PEM format was devised for sending these in an encoding of printable characters, so that they can be mailed. We focus on the PEM format below.

Most PEM formatted files encountered when exporting an RSA private or public key, or X509 certificates, are generated by OpenSSL. PEM files are essentially base64 encoded versions of the DER encoded data. A header and footer around the data designate what kind of data is inside the DER encoded string. An example of a PEM encoded file is:

    -----BEGIN PUBLIC KEY-----
    MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDMYfnvWtC8Id5bPKae5yXSxQTt
    +Zpul6AnnZWfI2TtIarvjHBFUtXRo96y7hoL4VWOPKGCsRqMFDkrbeUjRrx8iL91
    4/srnyf6sh9c8Zk04xEOpK1ypvBz+Ks4uZObtjnnitf0NBGdjMKxveTq+VE7BWUI
    yQjtQ8mbDOsiLLvh7wIDAQAB
    -----END PUBLIC KEY-----
The first and last line indicate the DER format that should be expected inside. The data inside is a base64 encoded version of the DER encoded information.