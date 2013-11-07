##############################################################################
#   Filename: .bashrc                                                        #
# Maintainer: Matt Muro <git@watchcity.com>                                  #
#        URL: http://github.com/seriousfunk/dotfiles                         #
##############################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#-------------------
# Personnal Aliases
#-------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files as well as other files.
alias l.='ls -ld .*'       #  Show hidden files only.
alias cl='clear;ll'        #  Clear the screen and then ll
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

#-------------------------------------------------------------
# Git shortcuts
#-------------------------------------------------------------
# Alias to the most recent Git on my systems (shared hosting)
if [ -f "/usr/local/cpanel/3rdparty/bin/git" ]; then
    alias git='/usr/local/cpanel/3rdparty/bin/git'
fi

alias gs='git status'
alias gl='git log'
alias gpl='git pull origin master'
alias gp='git push'

#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#-------------------------------------------------------------
# Set Editor
#-------------------------------------------------------------

export EDITOR="vim"
export VISUAL="vim"

set -o vi

#-------------------------------------------------------------
# Set Options
#-------------------------------------------------------------

shopt -s histappend histreedit histverify
HISTCONTROL=ignoreboth:ignoredups:erasedups
shopt -s cmdhist
shopt -s cdspell
set -o ignoreeof    # prevent exiting of shell with Ctrl-d

#-------------------------------------------------------------
# Set Prompt, Greeting, Exit messaging
#-------------------------------------------------------------

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
Bold='\[\033[1m\]'      # Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background

function _exit()        # Function to run upon exit of shell.
{
    echo -e "${BRed}Hasta la vista, baby${NC}"
}
trap _exit EXIT

# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi

# Test user type:
if [[ ${USER} == "root" ]]; then
    SU=${Red}           # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}          # User is not login user.
else
    SU=${BGreen}         # User is normal (well ... most of us are).
fi

# Now we construct the prompt.
# PROMPT_COMMAND="history -a"

function exitstatus {

    EXITSTATUS="$?"

    HOST="\h"
    USERNAME="\u"
    DIR="\w"
    NEWLINE="\n"
    DATE="\d"
    TIME="\t"

    # First USER:HOST sets the terminal window title
    PROMPT="\[\033]0;${USERNAME}@${HOST}: \w\007\n\[$BBlue\][\[${SU}\]${USERNAME}\[$BBlue\]:\[$BGreen\]${HOST}\[$BBlue\]][\[$BGreen\]${DIR}\[$BBlue\]]\[$NC\]" 
    if [ "${EXITSTATUS}" -eq 0 ]
    then
       # PS1="${PROMPT} ${BGreen}:)${NC}${NEWLINE}\$ "
       PS1="${PROMPT} ${BGreen}:)${NC} \$ "
    else
       # PS1="${PROMPT} ${BRed}:(${NC}${NEWLINE}\$ "
       PS1="${PROMPT} ${BRed}:(${NC} \$ "
    fi

    PS2="${Bold}>${NC} "
}

PROMPT_COMMAND=exitstatus;history -a;

