#!/bin/bash
#shebang

#3.- Comando que pueda dar la fecha.

# ---------------------------- Variables ----------------------------  #
# Entrada: Comando que corresponde a fecha.
# Salida: Fecha.

date=$(date +"%A, %d de %B de %Y")

# ---------------------------- Funciones  ----------------------------  #

get_date(){
echo $date
}

# ---------------------------- main  ----------------------------  #
main(){
get_date
}

main

# FASE: 1
