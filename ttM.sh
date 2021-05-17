#!/bin/bash

#colors:
NC='\033[0m'; # No Color
RED='\033[0;31m';

declare -A conversor;
if [[ $1 == "-r" ]]; then # if real morse selected
    correctMode=2;
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
    correctMode=1;
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



if [[ ${@:$correctMode} != "" ]]; then
    posibleFileFlagIndex=$((correctMode + 1));
    if [[ ${!posibleFileFlagIndex} == "-f" ]]; then # if -f flag found
        textToConvert=$(cat ${!$(($correctMode + 2))}); # The text to convert is the content of the file
    else
        textToConvert=${@:$correctMode}; # Arguments are the arguments
    fi
else # If no arguments with the text
    textToConvert=$(cat); # Try by getting the text from the pipe
fi
# If here, the inputed text is stored on textToConvert

reEx='^[a-z 0-9]*$';

if [[ ! "$textToConvert" =~ $reEx ]]; then # If text not valid
    printf "${RED}Invalid input.\nIt must be a combination of english characters with numbers and spaces.${NC}\n";
    exit 1;
fi

for (( i = 0; i < ${#textToConvert}; i++ )); do # For each character
    msg+="$spacer${conversor[${textToConvert:$i:1}]}"; # Convert it to morse
done
msg="${msg:${#spacer}:((${#msg} - 1))}"; # Remove first space(s)
echo "$msg"; # Return msg
printf "$msg" | xclip -i -selection clipboard; # Copy the msg to the clipboard
