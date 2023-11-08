#!/bin/bash
#
padding=""
nf=$(neofetch --stdout)
nf_lines=$(echo "$nf" | wc -l)
profile_art=$(cat "$HOME/.profile.ascii")
pa_lines=$(wc -l <(echo "$profile_art") | cut -d ' ' -f 1)
IFS= read -r profile_art_1line <<< "$profile_art"

pa_width=$(wc -m <(echo "$profile_art_1line") | cut -d ' ' -f 1)
((pa_width--))
padline=$(head -c $pa_width < /dev/zero | tr '\0' ' ')
padline=$'\n'$padline
if [ $pa_lines -lt $nf_lines ];then
    i=$(($nf_lines - $pa_lines))
    for x in $(seq 0 $i)
    do
        padding=$padding$padline
    done
fi
#this line converts ascii file to block characters only
#profile_art=$(sed $'s/[^[:space:]]/\e[7m \e[m/g' <<< $profile_art)
#
profile_art=$profile_art$padding
#
termcolors=''
for i in {1..8}
do
	 termcolors+=$( echo -e `tput setab $i`' '`tput sgr0` )
done
for i in {16..9}
do
	 termcolors+=$( echo -e `tput setab $i`' '`tput sgr0` )
done

paste <(echo -n "$profile_art" |\
        lolcat -r -h 1 -v 1 -f)\
         <((echo -e "$nf" &&\
        echo -n "$termcolors") |\
        sed -e "s,: .*,$(tput sgr0)&,")

unset termcolors, padding, padline, nf, pa_width, pa_lines,\
    profile_art, profile_art_1line
