tests=(
    "abcdefghijklmnopkrstuvwxyz 0123456789"
    "-r hola"
);

results=(
    '.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. -.- .-. ... - ..- ...- .-- -..- -.-- --..   ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----.'
    "hola"
);


echo "Starting test";


i=0;
while [[ $i < ${#tests[@]} ]]; do
    # echo ${i};
    # echo "${tests[$i]}";
    # echo ${#tests[@]};
    printf "Testing $i:\n    ./ttM.sh ${tests[$i]}\n";

    ( . ./ttM.sh ${tests[$i]}) > outputTemp.txt;

    if [ ! "$(cat outputTemp.txt)" == "${results[$i]}" ]; then
        echo "Does not match test1";
    fi

    i=$((i+1));
done



echo "End of testing";