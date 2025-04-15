#!/bin/bash
#shebang

#3.- Comando que pueda dar la hora

# ---------------------------- Variables ----------------------------  #
# Entrada: Comando que corresponde a hora.
# Salida: Hora.

tim=$(date +"%T")

# ---------------------------- Funciones  ----------------------------  #

get_time(){
echo $tim
}


# ---------------------------- main  ----------------------------  #
main(){
get_time
}

main

# FASE: 1
