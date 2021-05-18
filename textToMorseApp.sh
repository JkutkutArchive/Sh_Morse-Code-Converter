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
if [[ $1 == "-r" ]]; then # if real morse selected
    nextInput=2;
    spacer="   ";
    conversor[a]=". -";
    conversor[b]="- . . .";
    conversor[c]="- . - .";
    conversor[d]="- . .";
    conversor[e]=".";
    conversor[f]=". . - .";
    conversor[g]="- - .";
    conversor[h]=". . . .";
    conversor[i]=". .";
    conversor[j]=". - - -";
    conversor[k]="- . -";
    conversor[l]=". - . .";
    conversor[m]="- -";
    conversor[n]="- .";
    conversor[o]="- - -";
    conversor[p]=". - - .";
    conversor[q]="- - . -";
    conversor[r]=". - .";
    conversor[s]=". . .";
    conversor[t]="-";
    conversor[u]=". . -";
    conversor[v]=". . . -";
    conversor[w]=". - -";
    conversor[x]="- . . -";
    conversor[y]="- . - -";
    conversor[z]="- - . .";
    conversor[0]="- - - - -";
    conversor[1]=". - - - -";
    conversor[2]=". . - - -";
    conversor[3]=". . . - -";
    conversor[4]=". . . . -";
    conversor[5]=". . . . .";
    conversor[6]="- . . . .";
    conversor[7]="- - . . .";
    conversor[8]="- - - . .";
    conversor[9]="- - - - .";
    conversor[ ]=" ";
else # If reduced morse selected (DEFAULT)
    nextInput=1;
    spacer=" ";
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
    conversor[ ]=" ";
fi

reEx='^[a-z 0-9]*$';
firstTime=1;

ask(){ # Ask the argument on terminal, save the response in askResponse
    text=$1;
    textEnd=$2;
    msg="";
    read -p "$(echo -e ${LBLUE}"$text"${NC} $textEnd)->" askResponse;
}


printf "${BLUE}  __  __                                                     _           
 |  \/  | ___  _ __ ___  ___    ___ ___  _ ____   _____ _ __| |_ ___ _ __ 
 | \  / |/ _ \| '__/ __|/ _ \  / __/ _ \| '_ \ \ / / _ \ '__| __/ _ \ '__|
 | |\/| | (_) | |  \__ \  __/ | (_| (_) | | | \ V /  __/ |  | ||  __/ |   
 |_|  |_|\___/|_|  |___/\___|  \___\___/|_| |_|\_/ \___|_|   \__\___|_|\n\n\n${NC}"

while [ 1 ]; do
    if [[ ${@:$nextInput} == "" ]] || [[ $firstTime == 0 ]]; then 
        ask "Enter the text [*, exit]"; # Ask for the text
        if [ "$askResponse" == "exit" ]; then
            break;
        fi
    else # If text given as argument
        askResponse=${@:$nextInput}; # Arguments are the text
    fi

    if [[ ! "$askResponse" =~ $reEx ]]; then
        printf "${RED}Invalid input\n${NC}";
        continue;
    fi

    
    for (( i = 0; i < ${#askResponse}; i++ )); do
        echo -e "\""${LGREEN}"${askResponse:$i:1}"${NC}"\" is \"${conversor[${askResponse:$i:1}]}\"";
        msg+="$spacer${conversor[${askResponse:$i:1}]}"; # Convert it to morse
    done

    firstTime=0;

    printf "The morse code is:$msg\n(${LGREEN}Copied to the clipboard${NC})\n\n";
    printf "${msg:1:((${#msg} - 1))}" | xclip -i -selection clipboard;
done
