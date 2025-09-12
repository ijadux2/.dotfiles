
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git
         starship
         sudo)

source $ZSH/oh-my-zsh.sh

alias x='clear'
alias ls='lsd'
alias v='nvim'
alias lt='ls --tree'
alias madara='pikman'
alias cd='z'

fastfetch

if [ -e /home/ijadux2/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ijadux2/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. /home/ijadux2/.nix-profile/etc/profile.d/nix.sh

eval "$(zoxide init zsh)"
