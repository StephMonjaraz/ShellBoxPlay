#!/bin/bash

# Este script demuestra una alternativa en Bash puro al comando 'date +"%T"' leyendo
# la hora actual del sistema directamente desde el sistema de archivos virtual. 
# Nuestro objetivo es evitar el uso de comandos externos y depender únicamente de 
# las características integradas de Bash y los archivos virtuales proporcionados 
# por el sistema, como /sys/class/rtc/rtc0/time.

# Ruta al archivo que contiene la hora actual.
file="/sys/class/rtc/rtc0/time"

# Si el archivo existe y es legible, leeremos su contenido.
if [[ -r "$file" ]]; then 
    time="$(< "$file")"
    printf "\033[38;5;218mSon las:\033[0m \033[38;5;121m%s\033[0m\n" "$time"
else
    printf "\033[38;5;196mNo podemos proporcionarte la hora en este momento.\033[0m\n" >&2 
    exit 1
fi
