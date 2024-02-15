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
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
exec zsh
```

## Kubernetes supercharged
[Gist](https://gist.github.com/skobba/18ecf4dcdb6835acbf9c5efbe0c407bc):
```
wget https://gist.github.com/18ecf4dcdb6835acbf9c5efbe0c407bc.git](https://gist.githubusercontent.com/skobba/18ecf4dcdb6835acbf9c5efbe0c407bc/raw/f9a9103702489d278f1cd013235a81fa05d6f6cf/k8s-aliases.sh
chmod +x aliases.sh
echo "~/aliases.sh" >> ~/.zshrc
source ~/.zshrc
```



## Install OhMyZsh
* Ref: https://ohmyz.sh/#install

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Plugins
kube-ps1
```sh
# Mac
brew install kube-ps1

# Linux
# git clone

cat >>~/.zshrc<<EOF
source ~/.oh-my-zsh/plugins/kube-ps1/kube-ps1.plugin.zsh
PROMPT='$(kube_ps1)'$PROMPT
EOF
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

echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
```

## Uninstall
```
uninstall_oh_my_zsh
```

## zsh_codex 
```
vi ~/.zshrc
plugins=(git kubectl zsh_codex)
bindkey '^X' create_completion


apt install pipx
# NB: pipx does everything
# python3-pip python3-venv  
pipx install openai

cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/tom-doerr/zsh_codex.git

# Result
OpenAI API config file created at /Users/rep/.config/openaiapirc
Please edit it and add your organization ID and secret key
If you do not yet have an organization ID and secret key, you
need to register for OpenAI Codex:
https://openai.com/blog/openai-codex/

```
