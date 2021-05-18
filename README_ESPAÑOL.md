# Sh_Morse-Code-Converter
Este repositorio aloja varios scripts que permiten convertir texto a código morse.

## Content:

### · Script [textToMorseApp.sh](./textToMorseApp.sh)
This file allows the user to convert text to morse using an interface. Once executed the script, write the desired text and press enter to convert it. The converted text is copied to the clipboad usign the xclip command.

In order to exit, just type "exit" or press Ctrl+C.

Example:

        $ ./textToMorseApp.sh

        Enter the text [*, exit]->hello world
        "h" is "...."
        "e" is "."
        "l" is ".-.."
        "l" is ".-.."
        "o" is "---"
        The morse code is: .... . .-.. .-.. ---
        (Copied to the clipboard)

### · Script [ttM.sh](./ttM.sh)
This file contains a script to convert the input directly, without any aditional input or interface. Once the command is executed, the result will be returned and copied to the clipboard using the command xclip.

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
- If the input is not valid, a message is returned saying it.

## Considerations:
- The scripts only allows to convert text following this Regex expresion **'^[a-z 0-9]*$'**. This means that all code not formed with the english characters, numbers or spaces will not be valid.

- In this repository they are avalible two types of Morse code: reduced and real.
Real Morse code follows the standar logic of morse code, with the spaces between letters and words. However, this type of output tends to become really large prety fast. For this reason, the reduced morse code is implemented; where spaces between characters are deleted and spaces between words are reduced.

- The reduced morse code is the default option when running the scripts. See the documentation to change it to real morse if wanted.