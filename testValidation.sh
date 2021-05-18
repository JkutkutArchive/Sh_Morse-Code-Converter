echo "Starting test";

echo "Testing: $test1";

test1="abcdefghijklmnopkrstuvwxyz 0123456789";
# spectedResult='.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. -.- .-. ... - ..- ...- .-- -..- -.-- --..   ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----.';
spectedResult="hfdjs"

# Get current directory
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";


( . ./ttM.sh $test1;) > outputTemp.txt;

echo $(cat outputTemp.txt);
echo $spectedResult


if [ ! "$(cat outputTemp.txt)" == "$spectedResult" ]; then
    echo "Does not match test1";
fi


echo "End of testing";