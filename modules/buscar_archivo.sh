#!/bin/bash
# shebang

# Este script proporciona una implementación en Bash puro para buscar un archivo específico 
# dentro de un directorio dado. Evita el uso de comandos externos y se basa únicamente 
# en las características integradas de Bash.
# El script solicita al usuario el nombre del archivo y el directorio donde desea buscar.

# Solicita al usuario el nombre del archivo
printf "\033[38;5;159m ¿Qué archivo estás buscando? > \033[0m"
read filename

# Solicita al usuario el nombre de la carpeta
printf "\033[38;5;159m ¿En qué carpeta quieres buscar? > \033[0m"
read folder
printf "\n"

# Verifica si la carpeta existe
if [[ -d "$folder" ]]; then #si existe y es un directorio
    found=false
    # Itera sobre los archivos en la carpeta
    for file in "$folder"/*; do
        # Compara el nombre base del archivo con el nombre proporcionado
        if [[ "${file##*/}" == "$filename" ]]; then
            printf "✅ Archivo '%s' encontrado en la carpeta '%s'\n" "$filename" "$folder"
            found=true
            break
        fi
    done

    # Si no se encontró el archivo
    if [[ "$found" != true ]]; then
        printf "❌ Lo sentimos, no se encontró el archivo en la carpeta.\n"
    fi
else
    # Si la carpeta no existe
    printf "🚫 La carpeta especificada no existe.\n"
fi