echo "Starting test";
test1="abcdefghijklmnopkrstuvwxyz 0123456789";
morseR=$(./ttM.sh $test1);
echo ${morseR};
# echo $morseR