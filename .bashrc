# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias reload='clear && . ~/.bash_profile'
alias py="python"
alias ..='cd ..'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='exa -al --color=auto'
alias l='exa -l --color=auto'
#default prompt
#PS1='[\u@\h \W]\$ '
set bell-style visible
#manually colored, FxA's prompt
#PS1="\n\
#    \\[\e[32m\\]\u\[
#    \[\e[35m\]@\[\e[m\]\
#    \[\e[34m\]\H\[\e[m\]\
#    \[\e[35m\]:\[\e[m\]\
#    \[\e[36m\]\w\[\e[m\]\
#    \n\
#    \[\e[33m\]\[Jobs:(\j)]\[\e[m\]\
#    \n\
#    \[\e[31m\]>\[\e[m\] "
#
#printf %b '\e]12;red\a'
#FxA's prompt without colors or styles, separated by line for easier processing
psaa="\u@\H"
psa=$psaa
psb="Jobs: \j"
psc=""
reset=$(tput sgr0)
hwcursor='\001$(tput cvvis)\002'
mycursor="\e[?4;0;16c"
function makeprompt() {
    if [[ $HOME == $PWD ]]; then 
        psa+="/"
    fi
    psa+='\w'
    prompt="\n${psa@P}\n${psb@P}${psc@P}"
    psa=$psaa
}
PROMPT_COMMAND='makeprompt; printf %b $prompt | lolcat -r'
#export PS1="\001$(tput cuu 1 cuf 2)\002\001$(tput sgr0 cvvis)\002"
#PROMPT_COMMAND='makeprompt; echo -e $prompt | lolcat'
PS1="\n\001\e[31m\002>\001\e[m\002 $hwcursor"
# pnpm
export pnpm_home="/home/rex7goliath/.local/share/pnpm"
case ":$path:" in
  *":$pnpm_home:"*) ;;
  *) export path="$pnpm_home:$path" ;;
esac
# pnpm end
