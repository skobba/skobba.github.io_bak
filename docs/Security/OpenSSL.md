# OpenSSL

## Create ssh key for github
```sh
ssh-keygen -t rsa -b 4096 -C "gjermund@skobba.net" -f githubkey
```

## Create ssh key for github
```sh
# Creates a new RSA private kek with AES (Advanced Encryption Standard) algorithm

# Using a key size of 256 bits for cryptographic operations
openssl genpkey -algorithm RSA -out client.key -aes256

openssl genpkey -algorithm RSA -out client.key

# Generates a new Certificate Signing Request (CSR) 
openssl req -new -key client.key -out client.csr
```
