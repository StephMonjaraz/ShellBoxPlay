#!/bin/bash
#shebang

# ShellBoxPlay - Sistema central de terminal interactiva en Bash puro
# Este script proporciona un sistema modular que permite a los usuarios interactuar con diferentes
# funcionalidades mediante comandos específicos. 
# El objetivo es ofrecer una experiencia interactiva y clara, donde cada comando ejecuta un módulo
# correspondiente o permite al usuario ejecutar comandos del sistema.
# Los mensajes y el menú se muestran utilizando códigos de escape ANSI para un formato visual atractivo.
j='\033[38;2;25;0;40m'
v='\033[38;2;10;10;30m'
reset='\033[0m'

current_user="$USER"


show_welcome() {
    #bienvenida al usuario
    echo -en "${v}███████${j}███${v}█████████████${j}█${v}█████████████${j}███${v}█████████████${j}█${v}█████████████████████${j}██${v}████████████████████${j}████${v}█████████████${j}█${v}██████${j}███${v}███████${j}█${v}██████████${reset}"
    sleep 0.03
    echo -en "${v}██████${j}██${v}██████████████████████████████████████████${j}█${v}███████████${j}██${v}█████████████████${j}██${v}████████████${j}███${v}██████████${j}███${v}██████${j}█${v}██${j}███${v}██████${j}███${v}██████████${reset}"
    echo ""
#
    printf "\n \033[1;35m 👾 🎀 Hola, Bienvenidx %s a ShellBoxPlay. 👾 🎀\033[0m\n" "$current_user"
    printf "\n"
    printf "\033[1;35m 🍭 ¿Qué deseas hacer hoy?. 🍭\033[0m\n"
    printf "\n"
}

show_prompt() {
    # Prompt para  el usuario 
    printf "\033[38;5;216m %s:%s > \033[0m " "$current_user" "$PWD"
    read user_command
}


process_command() {
    #Seleccion de comando
    case "$user_command" in
        hora)
            ./modules/hora.sh
            ;;
            

        fecha)
            ./modules/fecha.sh
            ;;

        fechahora)
            fecha=$(./modules/fecha.sh)
            hora=$(./modules/hora.sh)
            printf "\033[38;5;120mEstamos a:\033[0m %s\033[38;5;120m y \033[0m%s\n" "$fecha" "$hora"

            ;;

        infosis)
            ./modules/infosys.sh
            ;;


        buscar)
            ./modules/buscar_archivo.sh
            ;;

        juego)
            ./modules/juego.sh
            ;;

        ayuda)
            ./modules/ayuda.sh
            ;;

        creditos)
            ./modules/creditos.sh
            ;;

        autenticacion)
            ./modules/autenticacion.sh
            ;;
        
        reproductor)
            ./modules/reproductor.sh
            ;;

        salir)
            printf "👾 🎀 Gracias %s por elegir ShellBoxPlay. 👾 🎀\n" "$current_user"
            ./modules/creditosart.sh
            awake=false
            exit 0
    
            ;;

        *)
            # Ejecuta comandos del sistema directamente si el usuario los escribe
            if ! $user_command 2>/dev/null; then
                printf "❌ No reconocemos al comando '%s'.\n" "$user_command"
                printf "👾 🎀 Por favor, intente nuevamente. 👾 🎀\n"
            fi
            ;;
    esac
}


main() {
    # Bucle que mantiene activa la terminal personalizada
    awake=true
    show_welcome
    while [[ "$awake" == true ]]; do
        show_prompt
        process_command
        printf "\n"
    done
}

# ---------------------------- Ejecución inicial ---------------------------- #

# Bloqueo de señales como Ctrl+C
source ./utils/bloqueo_ctrl.sh
activar_bloqueos

# Ejecutar animación de bienvenida Matrix Retro
bash ./modules/inicio.sh
clear

# Ejecutar autenticación
./modules/autenticacion.sh
if [[ $? -ne 0 ]]; then
    printf "⛔ Acceso denegado. Cerrando ShellBoxPlay.\n"
    exit 1
fi

# Si autenticación fue exitosa, inicia el programa principal
main
