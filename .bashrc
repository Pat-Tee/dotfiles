# ~/.bashrc
#
HISTCONTROL=ignoredups
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias reload='clear -x && . ~/.bash_profile'
alias ..='cd ..'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
if command -v exa &> /dev/null
then
alias ll='exa -al --color=auto'
alias l='exa -l --color=auto'
else
  alias ll='ls -al --color=auto'
  alias l='ls -l --color=auto'
fi

export EDITOR="nvim"
#default prompt
#PS1='[\u@\h \W]\$ '
set bell-style visible

#######################
if command -v lolcat &> /dev/null && lolcat --help | grep 'jaseg' &> /dev/null
then
    reset='\e[m'
    cursor='\e[?6;3;8c'
    wd='\w'
    ul='\e[4m'
    pa='${ul@P}\H${reset@P}'
    pb='\u'
    function getwd {
        local WD=${wd@P}
        if [[ ${WD:0:1} != '/' ]]
        then 
            echo -n '/';
        fi
        echo "$WD/"
    }
    PROMPT_COMMAND="echo -en '\n'${pa@P} | lolcat -S $RANDOM;
        getwd | lolcat -S $RANDOM;
        echo -e ${pb@P} | lolcat -S $RANDOM"
    PS1=""
    unset ul cursor reset
else
    echo -e "Error: c-lolcat not found.\n You need c-lolcat, \
which may be found here:\n<https://github.com/jaseg/lolcat/>\n"
fi
########################
