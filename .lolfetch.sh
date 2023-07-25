#!/bin/bash
#
if [ -f .weather.format ];then weatherformat=$(head -1 .weather.format)
else
    weatherformat="?0QnF"
fi
termcolors='' 
curl -s --max-time 3 https://wttr.in/$weatherformat > weather.txt
weather="$(cat weather.txt)"


for i in {1..8}
do
	 termcolors+=$( echo -en `tput setab $i`' '`tput sgr0` )
#	 [[ $i == 8 ]] && termcolors+="\n"
done
for i in {16..9}
do
	 termcolors+=$( echo -en `tput setab $i`' '`tput sgr0` )
#	 [[ $i == 8 ]] && termcolors+="\n"
done

paste <(cat $HOME/.profile.ascii |\
        lolcat -h 1 -v 1 -f)\
        <( ((neofetch --stdout) &&\
        (echo "$termcolors"; echo) &&\
        (cat "$HOME/weather.txt")) | 
        sed -e "s,:.*,$(tput sgr0)&,")
#-e '$a'"$termcolors")

#unset termcolors
