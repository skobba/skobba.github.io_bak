# Certificate Authority
Ref.: https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-debian-10

## Introduction
A Certificate Authority (CA) is an entity responsible for issuing digital certificates to verify identities on the internet. Although public CAs are a popular choice for verifying the identity of websites and other services that are provided to the general public, private CAs are typically used for closed groups and private services.

Building a private Certificate Authority will enable you to configure, test, and run programs that require encrypted connections between a client and a server. With a private CA, you can issue certificates for users, servers, or individual programs and services within your infrastructure.

Some examples of programs on Linux that use their own private CA are OpenVPN and Puppet . You can also configure your web server to use certificates issued by a private CA in order to make development and staging environments match production servers that use TLS to encrypt connections.

## Setup Easy-RSA
### Prerequisite
```
apt update
apt upgrade
apt install sudo
```

### Create user
```
adduser rsa
usermod -aG sudo rsa
```

### Install Easy-RSA
With the created user:
```
sudo apt install easy-rsa
```

### Preparing a Public Key Infrastructure Directory
```
mkdir ~/easy-rsa
ln -s /usr/share/easy-rsa/* ~/easy-rsa/
chmod 700 /home/rsa/easy-rsa
```

Initialize the PKI inside the easy-rsa directory:
```
./easyrsa init-pki

Result:
init-pki complete; you may now create a CA or requests.
Your newly created PKI dir is: /home/rsa/easy-rsa/pki
```

### Creating a Certificate Authority
> vi ~/easy-rsa/vars

```
set_var EASYRSA_REQ_COUNTRY    "NO"
set_var EASYRSA_REQ_PROVINCE   "Oslo"
set_var EASYRSA_REQ_CITY       "Oslo City"
set_var EASYRSA_REQ_ORG        "Skobbis"
set_var EASYRSA_REQ_EMAIL      "admin@skobba.net"
set_var EASYRSA_REQ_OU         "Community"
set_var EASYRSA_ALGO           "ec"
set_var EASYRSA_DIGEST         "sha512" 
```

Build CA:
Create a Passphrase and confirm the name.
> ./easyrsa build-ca


Result:
```
Common Name (eg: your user, host, or server name) [Easy-RSA CA]:

CA creation complete and you may now import and sign cert requests.
Your new CA certificate file for publishing is at:
/home/rsa/easy-rsa/pki/ca.crt
```

### Wrap Up
Now you have two important files which make up the public and private components of a Certificate Authority.

#### ~/easy-rsa/pki/ca.crt
ca.crt is the CA’s public certificate file. Users, servers, and clients will use this certificate to verify that they are part of the same web of trust. Every user and server that uses your CA will need to have a copy of this file. All parties will rely on the public certificate to ensure that someone is not impersonating a system and performing a Man-in-the-middle attack.

#### ~/easy-rsa/pki/private/ca.key
ca.key is the private key that the CA uses to sign certificates for servers and clients. If an attacker gains access to your CA and, in turn, your ca.key file, you will need to destroy your CA. This is why your ca.key file should only be on your CA machine and that, ideally, your CA machine should be kept offline when not signing certificate requests as an extra security measure.

