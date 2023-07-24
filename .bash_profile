#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc && neofetch --ascii ~/.profile.ascii | lolcat -h 1 -v 1

[[ -f .bash_pathloader ]] && . ~/.bash_pathloader
