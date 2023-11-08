#
# ~/.bash_profile
#
setterm --linewrap off
[[ -f ~/.bashrc ]] && . ~/.bashrc && [[ -f ~/.lolfetch.sh ]] && . ~/.lolfetch.sh
[[ -f .bash_pathloader ]] && . ~/.bash_pathloader

# halt and wait for user to continue
# read -n 1 -r -s
