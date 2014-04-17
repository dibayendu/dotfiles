source ~/projects/environment/oh-my-zsh/templates/zshrc.zsh-template
source ~/projects/environment/dotfiles/zsh/aliases.zsh
source ~/projects/environment/dotfiles/zsh/functions.zsh
source ~/projects/environment/dotfiles/zsh/variables.zsh
source $(brew --prefix nvm)/nvm.sh
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$(brew --prefix mysql)/bin
eval "$(rbenv init - zsh)"

setopt appendhistory autocd nomatch autopushd pushdignoredups promptsubst

# nvm - node version manager
unsetopt correct_all
setopt correct
