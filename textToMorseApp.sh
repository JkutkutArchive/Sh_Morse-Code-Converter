#!/bin/bash
#colors:
NC='\033[0m'; # No Color
RED='\033[0;31m';
GREEN='\033[0;32m';
LRED='\033[1;31m';
LGREEN='\033[1;32m';
YELLOW='\033[1;33m';
LBLUE='\033[1;34m';

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


ask(){ # Ask the argument on terminal, save the response in askResponse
    text=$1;
    textEnd=$2;
    msg="";
    read -p "$(echo -e ${LBLUE}"$text"${NC} $textEnd)->" askResponse;
}

firstTime=1;

while [ 1 ]; do
    if [[ $@ == "" ]] || [[ $firstTime == 0 ]]; then 
        ask "Enter the text [english alphabet only] [*, exit]"; # Ask for the text
        if [ "$askResponse" == "exit" ]; then
            break;
        fi
    else # If text given as argument
        askResponse=$@; # Arguments are the text
    fi
    
    for (( i = 0; i < ${#askResponse}; i++ )); do
        echo -e "\""${LGREEN}"${askResponse:$i:1}"${NC}"\" is \"${conversor[${askResponse:$i:1}]}\"";
        if [[ ${askResponse:$i:1} = " " ]] || [[ ${msg:(( ${#msg} - 1 )):1} = "|" ]]; then
            # Because of space between words is | (7 spaces), do not add extra spaces in the sides
            msg+="${conversor[${askResponse:$i:1}]}";
        else
            msg+=" ${conversor[${askResponse:$i:1}]}"; # 3 spaces = space between characters
        fi
    done

    firstTime=0;

    printf "The morse code is:$msg\n(${LGREEN}Copied to the clipboard${NC})\n\n";
    printf "${msg:1:((${#msg} - 1))}" | xclip -i -selection clipboard;
done
