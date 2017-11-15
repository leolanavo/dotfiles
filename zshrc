###############
### Exports ###
###############

export ZSH=~/.oh-my-zsh
export PATH=$PATH:/home/lana/scripts:$(ruby -e "print Gem.user_dir")/bin
export TERM=xterm-256color
export LANG=en_US.UTF-8
export CLASSPATH=~/Programação/MAC323/algs4.jar:./obj/:.:~/Documents/Bea/MAC0209/EP3/lib/osp.jar

#######################
### Theme's options ###
#######################

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

### Two line prompt ###
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

### Second line prefix ###
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{254}%F{124} $ %f%k%F{254}\uE0B0%f "

### Status ###
POWERLEVEL9K_STATUS_VERBOSE=false

### Directory ###
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_DIR_HOME_FOREGROUND='232'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='232'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='232'
POWERLEVEL9K_DIR_HOME_BACKGROUND='124'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='124'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='124'

### Github ###
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='076'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='184'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='184'

###############
### Plugins ###
###############

plugins=(git zsh-syntax-highlighting)

##############
### Source ###
##############

source $ZSH/oh-my-zsh.sh

###############
### Aliases ###
###############

alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gitconfig="vim ~/.gitconfig"
alias inputrc="vim ~/.inputrc"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.vim"
alias i3rc="vim ~/.config/i3/config"
alias polybarrc="vim ~/.config/polybar/config"
alias termiterc="vim ~/.config/termite/config"

export PATH="$HOME/.yarn/bin:$PATH"
