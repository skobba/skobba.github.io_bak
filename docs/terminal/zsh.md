# zsh
Change to zsh
```
chsh -s $(which zsh)

or

chsh -s /bin/zsh
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

echo 'source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
```

## Uninstall
```
uninstall_oh_my_zsh
```
