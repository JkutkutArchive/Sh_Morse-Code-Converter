#!/bin/bash

#colors:
NC='\033[0m'; # No Color
RED='\033[0;31m';

declare -A conversor;
conversor[a]=".-";
conversor[b]="-...";
conversor[c]="-.-.";
conversor[d]="-..";
conversor[e]=".";
conversor[f]="..-.";
conversor[g]="--.";
conversor[h]="....";
conversor[i]="..";
conversor[j]=".---";
conversor[k]="-.-";
conversor[l]=".-..";
conversor[m]="--";
conversor[n]="-.";
conversor[o]="---";
conversor[p]=".--.";
conversor[q]="--.-";
conversor[r]=".-.";
conversor[s]="...";
conversor[t]="-";
conversor[u]="..-";
conversor[v]="...-";
conversor[w]=".--";
conversor[x]="-..-";
conversor[y]="-.--";
conversor[z]="--..";
conversor[0]="-----";
conversor[1]=".----";
conversor[2]="..---";
conversor[3]="...--";
conversor[4]="....-";
conversor[5]=".....";
conversor[6]="-....";
conversor[7]="--...";
conversor[8]="---..";
conversor[9]="----.";
conversor[ ]="      ";


if [[ $@ != "" ]]; then
    if [[ $1 == "-f" ]]; then
        textToConvert=$(cat $2);
    else
        textToConvert=$@; # Arguments are the text
    fi
fi

reEx='^[a-z 0-9]*$';

if [[ "$textToConvert" =~ $reEx ]]; then
    echo "valid input";
else
    printf "${RED}Invalid input.\nIt must be a combination of english characters with numbers and spaces.${NC}\n";
    exit 1;
fi

for (( i = 0; i < ${#textToConvert}; i++ )); do
    if [[ ${textToConvert:$i:1} = " " ]] || [[ ${msg:(( ${#msg} - 1 )):1} = "|" ]]; then
        # Because of space between words is | (7 spaces), do not add extra spaces in the sides
        msg+="${conversor[${textToConvert:$i:1}]}";
    else
        msg+=" ${conversor[${textToConvert:$i:1}]}"; # 3 spaces = space between characters
    fi 
done
msg="${msg:1:((${#msg} - 1))}";
echo "$msg";
printf "$msg" | xclip -i -selection clipboard;
