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

Install powerlevel10k Theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set theme
```
ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
```

___Now open a new shell and configure Powerlevel10k___

Install Zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'>>~/.zshrc
```

Install Zsh-syntax-highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

echo 'source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
```

## Uninstall
```
uninstall_oh_my_zsh
```
