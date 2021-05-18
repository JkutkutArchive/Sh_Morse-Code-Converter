echo "Starting test";
test1="abcdefghijklmnopkrstuvwxyz 0123456789";
echo "Testing: $test1";
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo $__dir;


( . ./ttM.sh $test1;)
echo "done $msg"
echo ${morseR};
# echo $morseR