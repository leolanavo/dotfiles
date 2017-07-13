prompt_zsh_funnyIcon () {
    local color='%F{004}'
    local bgcolor='%K{235}'
    local symbol='\uf300'
    if [ ${mode} = 'minimal' ]; then
        echo -n "%K{016}%F{235}\uE0B2%f%k$bgcolor$color $symbol %f%k"; 
    else    
        echo -n "%K{231}%F{235}\uE0B2%f%k$bgcolor$color $symbol %f%k"; 
    fi
}   

prompt_zsh_user () {
    local color='%F{016}'
    local bgcolor='%K{160}'
    echo -n "$color$bgcolor Lana %f%k%F{160}%K{055}\ue0b0%f%k"; 
}

prompt_zsh_host () {
    local color='%F{255}'
    local bgcolor='%K{055}'
    host=`cat /etc/hostname` 
    echo -n "$color$bgcolor $host %f%k%F{055}%K{004}\ue0b0%f%k"; 
}

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Export true colors
export TERM=xterm-256color

#Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{004}%F{231} $ %f%k%F{004}\uE0B0%f "

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='051'

#Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M}"
POWERLEVEL9K_TIME_FOREGROUND='001'
POWERLEVEL9K_TIME_BACKGROUND='231'

#Status
POWERLEVEL9K_STATUS_VERBOSE=false

#Set the os_icon to the Arch Icon
POWERLEVEL9K_LINUX_ICON="\uF300"

#Directory
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_DIR_HOME_FOREGROUND='255'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='255'

#Battery
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='016'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='016'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='016'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='016'

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='172'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='172'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='172'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='172'

# Github
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='076'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='184'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='184'

#Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export CLASSPATH=~/Programação/MAC323/algs4.jar:./obj/:.:~/Documents/Bea/MAC0209/EP3/lib/osp.jar

# Aliases
alias zshrc="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias gitconfig="nvim ~/.gitconfig"
alias inputrc="nvim ~/.inputrc"
alias vimrc="nvim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias i3rc="nvim ~/.config/i3/config"
alias i3blocksrc="nvim ~/.config/i3/i3blocks.conf"

# Resize
LAST_COLUMNS=0
TRAPWINCH() {
    init
    
    if [ ${COLUMNS} -ne ${LAST_COLUMNS} ]; then 
        clear
        zle reset-prompt
        COLUMNS=${LAST_COLUMNS}
    fi
}

# Update the prompt without new line
TRAPALARM() {
    zle reset-prompt
}

lp_size() {
    LEFT_P="$(print_icon MULTILINE_FIRST_PROMPT_PREFIX)%f%b%k$(build_left_prompt)"
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo "${#${(S%%)LEFT_P//$~zero/}}"
}

rp_size() {
    LEFT_P="$RPROMPT_PREFIX%f%b%k$(build_right_prompt)%{$reset_color%}$RPROMPT_SUFFIX"
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo "${#${(S%%)LEFT_P//$~zero/}}"
}

# resize() {
# }

mode="none"
mode () {
    if [ $1 = '' ]; then
        echo "Usage: mode <profile>"
    else 
        mode=$1
        $1
    fi
}

#################################################################
###                          PROFILES                         ###
#################################################################

normal() {
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(zsh_user zsh_host dir vcs battery)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time zsh_funnyIcon)
}

normal_minimal() {
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(battery dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time zsh_funnyIcon)
}

testing() {
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(zsh_user zsh_host ram swap command_execution_time dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery zsh_funnyIcon)
}

testing_minimal() {
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ram swap command_execution_time)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status zsh_funnyIcon)
}

init() {
    minimal="_minimal"
    if [ $mode = "none" ]; then
        mode='normal'
    fi
    
    total_size=$((`lp_size` + `rp_size`))
    if [ ${total_size} -gt ${COLUMNS} ]; then
        mode=$mode$minimal    
    fi 
    mode $mode
    mode=`echo $mode | cut -d "_" -f 1`
}

init
