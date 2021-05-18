# Sh_Morse-Code-Converter
This repository stores some scripts to convert text to morse code.

## Considerations:
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

    Morse reduced (default)
    
    $ ./ttM.sh hello world
    
    Output:
    .... . .-.. .-.. ---   .-- --- .-. .-.. -..
.

    Real Morse code (using parameter):

    $ ./ttM.sh -r hello world
    
    Output:
    . . . .   .   . - . .   . - . .   - - -       . - -   - - -   . - .   . - . .   - . .
    
.
    jdsflsaf ./ttM.sh
    ./ttM.sh jflsdkf
    ./ttM.sh -r fslkfald
    ./ttM.sh -r -f jflsdlf

