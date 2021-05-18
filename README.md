# Sh_Morse-Code-Converter
This repository stores some scripts to convert text to morse code.

## Considerations:
- The scripts only allows to convert text following this Regex expresion **'^[a-z 0-9]*$'**. This means that all code not formed with the english characters, numbers or spaces will not be valid.

- In this repository they are avalible two types of Morse code: reduced and real.
Real Morse code follows the standar logic of morse code, with the spaces between letters and words. However, this type of output tends to become really large prety fast. For this reason, the reduced morse code is implemented; where spaces between characters are deleted and spaces between words are reduced.

- The reduced morse code is the default option when running the scripts. See the documentation to change it to real morse if wanted.

## Content:

### · Script [ttM.sh](./ttM.sh)
This file contains a script to convert the input directly, without any aditional input or interface.

    $ ./ttM.sh hello world

    Output:
    .... . .-.. .-.. ---   .-- --- .-. .-.. -..

#### Full documentation:
In order to use the command, all the following inputs are valid:
- Morse reduced (default)

        $ ./ttM.sh hello world
        
        Output:
        .... . .-.. .-.. ---   .-- --- .-. .-.. -..

- Real Morse code (using parameter):

        $ ./ttM.sh -r hello world
        
        Output:
        . . . .   .   . - . .   . - . .   - - -       . - -   - - -   . - .   . - . .   - . .

- The input can be inputed using also this syntax:

        (imagine a file created by:) 
        $ echo "hello world" > input.txt;

        $ ./ttM.sh -f input.txt

        or

        $ ./ttM.sh < input.txt
        
        or 

        $ cat input.txt | ./ttM.sh

        Output
        .... . .-.. .-.. ---   .-- --- .-. .-.. -..

- Using real Morse code:

        (imagine a file created by:) 
        $ echo "hello world" > input.txt;

        $ ./ttM.sh -r -f input.txt

        or

        $ ./ttM.sh -r < input.txt
        
        or 

        $ cat input.txt | ./ttM.sh -r

        Output
        . . . .   .   . - . .   . - . .   - - -       . - -   - - -   . - .   . - . .   - . .