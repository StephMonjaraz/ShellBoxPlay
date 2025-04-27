#!/bin/bash

# Este script proporciona un menú de ayuda para ShellBoxPlay, enumerando todos los comandos disponibles 
# y sus respectivas funcionalidades. El objetivo es ofrecer a los usuarios una referencia clara y 
# concisa para interactuar con el sistema.
# El menú se muestra utilizando códigos de escape ANSI para el formato de colores, asegurando 
# una interfaz visualmente atractiva y fácil de usar.

# Encabezado del menú 
printf "\n"
printf  "\033[38;5;117m  Menú de Comandos Disponibles  \033[0m\n" 
printf "\033[38;5;117m ------------------------------- \033[0m\n"
printf "\n"

# Lista de comandos 
printf "\033[38;5;229m1.-\033[0m\033[38;5;159m ayuda\033[0m: \033[38;5;229mMuestra la lista de comandos disponibles.\033[0m \n"
printf "\033[38;5;229m2.-\033[0m\033[38;5;159m fecha\033[0m: \033[38;5;229mMuestra la fecha actual.\033[0m\n"
printf "\033[38;5;229m3.-\033[0m\033[38;5;159m hora\033[0m: \033[38;5;229mMuestra la hora actual.\033[0m\n"
printf "\033[38;5;229m4.-\033[0m\033[38;5;159m fechahora\033[0m: \033[38;5;229mMuestra la fecha y hora actual.\033[0m \n"
printf "\033[38;5;229m5.-\033[0m\033[38;5;159m juego\033[0m: \033[38;5;229m Juego de gato.\033[0m \n"
printf "\033[38;5;229m6.-\033[0m\033[38;5;159m infosis\033[0m: \033[38;5;229mMuestra información del sistema.\033[0m \n"
printf "\033[38;5;229m7.-\033[0m\033[38;5;159m creditos\033[0m: \033[38;5;229mMuestra la información de la desarrolladora.\033[0m \n"
printf "\033[38;5;229m8.-\033[0m\033[38;5;159m buscar\033[0m: \033[38;5;229mBusca un archivo específico dentro de un directorio dado.\033[0m \n"
printf "\033[38;5;229m9.-\033[0m\033[38;5;159m reproductor\033[0m: \033[38;5;229m Reproductor de musica.\033[0m \n"

printf "\n"