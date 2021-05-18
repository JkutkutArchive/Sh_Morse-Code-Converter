# Sh_Morse-Code-Converter
This repository stores some scripts to convert text to morse code.


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
    