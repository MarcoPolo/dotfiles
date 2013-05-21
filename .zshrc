ZSH=$HOME/.oh-my-zsh


ZSH_THEME="miloshadzic"
plugins=(git archlinux lol sprunge vi-mode)

#lets open anything python, cpp, or js with vim
alias -s js=vim
alias -s py=vim
alias -s cpp=vim

source $ZSH/oh-my-zsh.sh

#256 colors
export TERM="xterm-256color"

#simple shortcuts
alias macplz="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
mkcd() { mkdir -p "$@" && cd "$_"; }

# use v to launch edit command
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^R' history-incremental-search-backward

export PATH=~/bin:$PATH


export NEMO_LOCATION=198.61.196.240
export NEMO_PORT=81

#Silly qoutes
qouteFile=~/dotfiles/rexyLines
qouteCount=$(wc -l $qouteFile | awk '{print $1}')
let randnum=$RANDOM%$qouteCount
cowsay -f tux $(sed -n  "$randnum,$randnum p" $qouteFile) | lolcat
