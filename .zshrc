# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux lol sprunge vi-mode)

#lets open anything python, cpp, or js with vim
alias -s js=vim
alias -s py=vim
alias -s cpp=vim


#256 colors
export TERM="xterm-256color"

let randnum=$RANDOM%12660
alias macplz="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
mkcd() { mkdir -p "$@" && cd "$_"; }


source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/marco/appengine/google_appengine/:~/android-sdk-linux/platform-tools/:/home/marco/android/android-sdk-linux_x86/tools/:/opt/msp430-gcc-4.4.5/bin:/opt/msp430-gcc-4.4.5/bin:~/scripts:~/.gem/ruby/1.8/bin:~/.gem/ruby/1.9.1/bin:~/android-sdk-linux/tools:~/eclipse/:~/storm/bin



export JAVA_HOME=/opt/java
export HIVE_HOME=/home/marco/hadoop/hive-0.8.1-bin

export MAHOUT_LOCAL=TRUE


export PATH=$HIVE_HOME/bin:$PATH

export PATH=$JAVA_HOME/bin:$PATH

export PATH=~/hadoop/mahout/bin:$PATH
export PATH=~/hadoop/hadoop/bin:$PATH


# use v to launch edit command
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line


alias lein=lein2



bindkey '^R' history-incremental-search-backward
export PATH=/home/marco/.cljr/bin:/home/marco//hadoop/hadoop/bin:/home/marco//hadoop/mahout/bin:/opt/java/bin:/home/marco/hadoop/hive-0.8.1-bin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/marco/appengine/google_appengine/:/home/marco//android-sdk-linux/platform-tools/:/home/marco/android/android-sdk-linux_x86/tools/:/opt/msp430-gcc-4.4.5/bin:/opt/msp430-gcc-4.4.5/bin:/home/marco//scripts:/home/marco//.gem/ruby/1.8/bin:/home/marco//.gem/ruby/1.9.1/bin:/home/marco//android-sdk-linux/tools:/home/marco//eclipse/:~/storm/bin

cowsay -f tux $(sed -n  "$randnum,$randnum p" ~/dotfiles/rexyLines) | lolcat
