# zsh
## Ref
> https://ohmyz.sh/#install

## Install
> sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Install powerlevel10k
> git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#### Set theme
> ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

#### Set shell
> chsh -s /bin/zsh

Now open a new shell and configure Powerlevel10k

## Install Zsh-autosuggestions
> git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

> echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'>>~/.zshrc

## Install Zsh-syntax-highlighting

> git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

> echo 'source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
