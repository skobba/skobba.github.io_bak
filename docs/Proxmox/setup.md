# Setup

## Repositories
Remove enterprise repository
```
rm /etc/apt/sources.list.d/pve-enterprise.list
apt update && apt -y full-upgrade
```

Add no-subscription or pve-test repository 
```
vi /etc/apt/sources.list

deb http://download.proxmox.com/debian bullseye pve-no-subscription
apt update && apt -y full-upgrade
reboot
```

# zsh
Script that setup zsh, OhMyZsh, Powerlevel10k

```
apt update
apt -y install zsh git
chsh -s /bin/zsh
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
