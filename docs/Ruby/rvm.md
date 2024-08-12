# Install

```sh
curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm
echo 'source ~/.rvm/scripts/rvm' >> ~/.zshrc
```

## Set version
```sh
rvm --version
rvm install 3.3.4
#or
rvm install "ruby-3.3.4"
```

## Troubleshoot
Reinstall:
```sh
rvm reinstall 3.3.4 --with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-zlib-dir=$(brew --prefix zlib)
```

Another version:
```sh
rvm implode
rm -rf ~/.rvm
rvm install 3.3.4
```


