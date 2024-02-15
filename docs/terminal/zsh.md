# zsh
Change to zsh
```
chsh -s $(which zsh)

or

chsh -s /bin/zsh
```

## Short script that setup zsh, OhMyZsh, Powerlevel10k
```sh
apt-get -y install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'>>~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
exec zsh
```

## kube-ps1
```sh
brew install kube-ps1
cat >>~/.zshrc<<EOF
source ~/.oh-my-zsh/plugins/kube-ps1/kube-ps1.plugin.zsh
PROMPT='$(kube_ps1)'$PROMPT
EOF
```

## Install OhMyZsh
* Ref: https://ohmyz.sh/#install

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install Powerlevel10k Theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

Configure p10k
```
p10k configure
exec zsh

Config in:
~/.p10k.zsh
```

## Install Zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'>>~/.zshrc
```

## Install Zsh-syntax-highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

echo 'source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
```

## Uninstall
```
uninstall_oh_my_zsh
```

## zsh_codex 
```
apt install python3-pip
git clone https://github.com/tom-doerr/zsh_codex.git
```
