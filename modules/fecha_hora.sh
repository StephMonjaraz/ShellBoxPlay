#!/bin/bash
#shebang

#3.- Comando que pueda dar la fecha y la hora

# ---------------------------- Variables ----------------------------  #
# Entrada: Comando que corresponde a fecha y hora
# Salida: Fecha y hora.

date=$(date +"%A, %d de %B de %Y")
tim=$(date +"%T")

# ---------------------------- Funciones  ----------------------------  #

get_time(){
echo $tim
}

get_date(){
echo $date
}

# ---------------------------- main  ----------------------------  #
main(){
get_date
get_time
}

main

# FASE: 1
