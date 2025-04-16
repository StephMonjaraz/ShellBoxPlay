#!/bin/bash

##### Comando que pueda buscar por un archivo en un directorio específico recibe dosparámetros: La carpeta a buscar 
#     y el archivo que va a buscar.

#¿Qué problema quieres resolver con el script? Poder buscar un archivo en un directorio.
#¿Cuál es el comportamiento esperado del script? Indicar si es que el archivo fue o no fue encontrado.
#¿Qué información necesita el usuario proporcionar? necesita proporcionar el comando, después indicará en que carpeta buscar el archivo
#                                                   y cual es el archivo que esta buscando.
#¿Qué debe mostrar el script como resultado? El archivo o en caso contrario, indicar que no se encontró.

# ---------------------------- Variables ----------------------------  #
# Entrada: archivo que desea buscar -> archive y carpta -> file
# Salida: Se ejecuta el script y se indica que se encontró el archivo en la carpetao  se muestra un mensaje de que no se encontró la carpeta


# ---------------------------- Funciones  ----------------------------  #


search_file(){
echo -n -e "\033[38;5;159m ¿Qué archivo estas buscando? > \033[0m"
read filename
echo -n -e "\033[38;5;159m ¿En que carpeta quieres buscarlo? > \033[0m"
read folder
echo
}

#find /home/stephanie-blue/Ingenieria/JessiStudies/librosPROGRA -name "HEADFIRST.pdf
is_it_there(){
result=$(find "$folder" -name "$filename" 2>/dev/null) #2>/dev/null para ocultar errores.
if [ -n "$result" ]; then #-n para ver que no este vacia.
echo "Se encontró el archivo en: $folder"
else
echo "Lo sentimos, no se encontró el archivo en la carpeta."
fi
}


main(){
search_file
is_it_there
}
main

