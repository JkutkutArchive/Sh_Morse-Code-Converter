# Sh_Morse-Code-Converter
Este repositorio aloja varios scripts que permiten convertir texto a código morse.

## Contenido:

### · Script [textToMorseApp.sh](./textToMorseApp.sh)
Este archivo permite al usuario convertir texto a morse haciendo uso de una interfaz. Una vez ejecutado el script, introduce el texto y presiona enter para convertirlo. El texto en morse es copiado a el portapapeles haciendo uso del commando xclip.

Para salir, escribe "exit" o presiona Ctrl+C.

Ejemplo:

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
Este archivo contiene un commando para convertir el input dado directamente, sin necesidad de argumentos adicionales o interfaz. Una vez el comando ha sido ejecutado, el resultado será devuelto y copiado al portapapeles usando el comando xclip.

    $ ./ttM.sh hello world

    Output:
    .... . .-.. .-.. ---   .-- --- .-. .-.. -..

#### Documentación:
Para poder usar el comando, existen múltiples maneras de adjuntar el input:
- Morse reduced (default)

        $ ./ttM.sh hello world

        Output:
        .... . .-.. .-.. ---   .-- --- .-. .-.. -..

- Real Morse code (con parámetro):

        $ ./ttM.sh -r hello world
        
        Output:
        . . . .   .   . - . .   . - . .   - - -       . - -   - - -   . - .   . - . .   - . .

- El input puede ser agregado usando esta sintáxis:

        (Suponiendo la creación de un archivo:) 
        $ echo "hello world" > input.txt;

        $ ./ttM.sh -f input.txt

        o

        $ ./ttM.sh < input.txt
        
        o 

        $ cat input.txt | ./ttM.sh

        Output
        .... . .-.. .-.. ---   .-- --- .-. .-.. -..

- Usando real Morse code:

        (Suponiendo la creación de un archivo:) 
        $ echo "hello world" > input.txt;

        $ ./ttM.sh -r -f input.txt

        o

        $ ./ttM.sh -r < input.txt
        
        o 

        $ cat input.txt | ./ttM.sh -r

        Output
        . . . .   .   . - . .   . - . .   - - -       . - -   - - -   . - .   . - . .   - . .
- Si el input no es válido, un mensaje es devuelto avisándolo.

## Consideraciones:
- Estos scripts sólo permiten convertir texto que cumpla esta expresión regular **'^[a-z 0-9]*$'**. Esto significa que todo input no formado por los letras inglesas, números o espacios no será válido.

- En este repositorio hay disponibles dos tipos de Código Morse: el real y el reducido. Código Morse real sigue la lógica del morse estandar, con espacios entre letras y palabras. Sin embargo, este tipo de output tiende a ser muy largo de manera rápida. Por esta razón, la versión reducida es implementada por defecto; donde los espacios son reducidos.

- El Código Morse reducido es la versión por defecto al ejetutar los scripts. Mirar la documentación para cambiar a el Código Morse real si así lo desea.