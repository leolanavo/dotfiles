# Path to your oh-my-zsh installation.
prompt_zsh_funnyIcon () {
    state=`spotify-cli now-playing`
    local color='%F{004}'
    local bgcolor='%K{235}'
    local symbol='\uf300'
    if [ $state = "Spotify service not found - is it running?" ]; then
        echo -n "%K{231}%F{235}\uE0B2%f%k$bgcolor$color $symbol %f%k"; 
    else    
        echo -n "%K{240}%F{235}\uE0B2%f%k$bgcolor$color $symbol %f%k"; 
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

prompt_zsh_Spotify () {
    local color='%F{112}'
    local bgcolor='%K{240}'
    state=`spotify-cli now-playing`;
    if [ $state = "Spotify service not found - is it running?" ]; then
 
    else 
      artist=`spotify-cli now-playing | grep "spotify_artist_name" | cut -d'=' -f2`
      track=`spotify-cli now-playing | grep "spotify_track_name" | cut -d'=' -f2`
      tLen=${#track}
      short=${track:0:$tLen}
      if [ "$tLen" -gt "30" ]; then
      short=${track:0:30}"(...)\""
      fi
      echo -n "%K{231}%F{240}\uE0B2%f%k$bgcolor$color \uf1bc $artist - $short %f%k";

    fi
}

export ZSH=~/.oh-my-zsh
export TERM=xterm-256color

#Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{004}%F{231} $ %f%k%F{004}\uE0B0%f "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(zsh_user zsh_host dir battery vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time zsh_Spotify zsh_funnyIcon)

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
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='255'

#Battery
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='016'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='white'

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='202'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='202'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='172'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='202'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='184'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='076'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='184'


#Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export CLASSPATH=~/Programação/MAC323/algs4.jar:./class/:.
export PATH=$PATH:~/.opam/system/bin

#Aliases
alias zshrc="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias gitconfig="nvim ~/.gitconfig"
alias inputrc="nvim ~/.inputrc"
alias vimrc="nvim ~/.vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
