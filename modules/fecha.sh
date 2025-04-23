#!/bin/bash
#shebang

# Este script demuestra una alternativa en Bash puro al comando 'date' leyendo
# la fecha actual del sistema directamente desde el sistema de archivos virtual. 
# Nuestro objetivo es evitar el uso de comandos externos y depender únicamente de 
# las características integradas de Bash y los archivos virtuales proporcionados 
# por el sistema, como /sys/class/rtc/rtc0/date.

# Ruta al archivo que contiene la fecha actual
file="/sys/class/rtc/rtc0/date"

# Si el archivo existe y es legible, leeremos su contenido
if [ -r "$file" ]; then 
    # Leer el contenido del archivo en una variable y mostrarlo
    date="$(< "$file")"
    printf "\033[38;5;121m$date%s.\033[0m   \n"
else # Si el archivo no es legible
    printf "\033[38;5;218mNo podemos proporcionarte la fecha en este momento\033[0m  \n" >&2
    exit 1
fi