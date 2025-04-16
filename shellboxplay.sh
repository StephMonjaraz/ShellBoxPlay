#!/bin/bash
#shebang

# ShellBoxPlay - Sistema Modular de la terminal simulada.
#Prueba 1.

# 👾 🎀 Script principal de ShellBoxPlay 👾 🎀


#¿Qué problema quieres resolver con shellboxplay.sh? Quiero tener un sistema central que funcione como el núcleo de mi terminal, que controle a los modulos individuales.
#¿Cuál es el comportamiento esperado del script? Ser una terminal personalizada que tenga un prompt interactivo, para que el  usuario escriba comandos y se ejecute el script correspondiente si el comando es válido.
#¿Qué datos necesitas que el usuario proporcione durante la ejecución? Necesito que indique lo que quiera hacer mediante comandos.
#¿Qué salidas o resultados debe mostrar el script? El resultado del módulo ejecutado, o un mensaje de error si el comando no existe. Además, debe mantenerse activo hasta que el usuario escriba salir.


# ---------------------------- Variables ----------------------------  #
# Entrada: Comando que da el usuario -> user_command
# Salida: Se ejecuta el script o se muestra un mensaje de error para comando 
# inválidos.  -> ./modules/script.sh
# Variable: algo que nos diga si el usuario quiere salir, o se mantiene el bucle.
# -> awake tambien una variable que nos diga que usario es, usare whoami -> current_usser

#awake=true
current_user=$(whoami)

# ---------------------------- Funciones  ----------------------------  #
show_welcome() {
#echo "👾 🎀 Hola, Bienvenidx $current_user a la terminal. 👾 🎀"
#prueba de color, rosa
echo -e "\033[1;35m 👾 🎀 Hola, Bienvenidx $current_user a ShellBoxPlay. 👾 🎀\033[0m"
echo
echo -e "\033[1;35m 🍭 ¿Qúe deseas hacer hoy?. 🍭\033[0m"
echo

}

show_prompt() {
#\033[38 durazno
echo -n -e "\033[38;5;216m ShellBoxPlay > \033[0m"
#echo -n -e "\033[1;35m ShelBoxPlay > 38;5;216"
#echo -n -e "ShellBoxPlay > "
read user_command
}

# ---------------------------- Selección de comandos.  ----------------------------  #
process_command(){

# ---------------------------- CASE  ----------------------------  #
case $user_command in

time) #hora
./modules/hora.sh
;;

date) #fecha
./modules/fecha.sh
;;

infosis) #informacion del sistema
./modules/infosys.sh
;;

cercatrova) #buscar archivo
#cercatrova es temporal ;)
./modules/buscar_archivo.sh
;;


salir) #salida del sistema
echo "👾 🎀 Gracias $current_user por elegir ShellBoxPlay. 👾 🎀"
awake=false
;;

*) # sería como decir "ninguno de los anteriores"
echo "No reconocemos el comando '$user_command'. "
echo
echo "👾 🎀 Por favor, intente nuevamente. 👾 🎀"
;;

esac
}



clear_screen(){
clear
}

# ---------------------------- Flujo  ----------------------------  #

#1 debe enviar un mensaje de bienvenda.
#2 leer el comando del usuario
#3 si es algo diferente a salir, puede continuar el flujo
     #si es salir envia mensaje de error.
#4 repite el ciclo siempre que no lea el comando salir


main() { #mientras el usaurio no escriba salr, el bucle continua.
awake=true
show_welcome         
while [ "$awake" = true ];
do
show_prompt         
process_command
echo
done
}

main
