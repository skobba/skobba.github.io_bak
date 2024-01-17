# nvm
* Implemented as a POSIX-compliant function
* Should work on sh, dash, bash, ksh, zsh

## node folder
```
~/.nvm/versions/node/v20.10.0
```

## Install
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

Make sure it´s added to .zshrc:
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

## List Versions
```
nvm ls
nvm ls-remote
```

## Install and Use Specific Version
```
nvm install 12.16.3
nvm use 12.16.3
```
