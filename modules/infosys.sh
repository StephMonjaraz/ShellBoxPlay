#!/bin/bash
#shebang

##### Comando “infosis” que permita mostrar la información del sistema, la información que deberá mostrar será  #####
#      1. Memoria RAM
#      2. Arquitectura del sistema
#      3. Versión del SO.

#¿Qué problema quieres resolver con infosys.sh? Tiene que dar información sobre la memoria RAM, arquitectura del sistema y la version del SO.
#¿Cuál es el comportamiento esperado del script? Imprimir en pantalla todo el punto anterior.
#¿Qué información necesita el usuario proporcionar? el comando infosis.
#¿Qué debe mostrar el script como resultado? la información. 


# ---------------------------- Variables ----------------------------  #
# Entrada: Comando que da el usuario -> user_command
# Salida: Se ejecuta el script   -> ./modules/infosys.sh
# Se muestra en pantalla la información


# ---------------------------- Funciones  ----------------------------  #

get_info(){
SO=$(lsb_release -d | cut -f2)
echo "Sistema operativo: $SO"
arch=$(uname -m)
echo "Arquitectura: $arch"
ram_total=$(free -m | awk '/Mem:/ {print $2}')
ram_free=$(free -m | awk '/Mem:/ {print $7}')
ram=$(free -m | awk '/^Memoria:/ {print "Memoria total:", $2, "MB | Memoria libre:", $7, "MB"}')

echo "RAM: $ram"
}

print_info(){
echo
}


main(){
get_info
}

main
