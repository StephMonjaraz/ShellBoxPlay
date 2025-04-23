#!/bin/bash
#shebang

# ShellBoxPlay - Sistema central de terminal interactiva en Bash puro
# Este script proporciona un sistema modular que permite a los usuarios interactuar con diferentes
# funcionalidades mediante comandos específicos. 
# El objetivo es ofrecer una experiencia interactiva y clara, donde cada comando ejecuta un módulo
# correspondiente o permite al usuario ejecutar comandos del sistema.
# Los mensajes y el menú se muestran utilizando códigos de escape ANSI para un formato visual atractivo.

current_user="$USER"


show_welcome() {
    #mensaje de bienvenida al usuario
    printf "\033[1;35m 👾 🎀 Hola, Bienvenidx %s a ShellBoxPlay. 👾 🎀\033[0m\n" "$current_user"
    printf "\n"
    printf "\033[1;35m 🍭 ¿Qué deseas hacer hoy?. 🍭\033[0m\n"
    printf "\n"
}


show_prompt() {
    #prompt interactivo para que el usuario ingrese comandos
    printf "\033[38;5;216m %s:%s > \033[0m " "$current_user" "$PWD"
    read user_command
}

process_command() {
    # comandos para elección.
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
            printf "Estamos a: %s y son las: %s\n" "$fecha" "$hora"
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

        salir)
            printf "👾 🎀 Gracias %s por elegir ShellBoxPlay. 👾 🎀\n" "$current_user"
            awake=false
            exit 0
            ;;

        *)
            #comandos del sistema.
            $user_command 2>/dev/null
            if [[ $? -ne 0 ]]; then
                printf "❌ No reconocemos al comando '%s' no es reconocido.\n" "$user_command"
                printf "👾 🎀 Por favor, intente nuevamente. 👾 🎀\n"
            fi
            ;;
    esac
}

main() {
    # Bucle principal 
    awake=true
    show_welcome
    while [[ "$awake" == true ]]; do
        show_prompt
        process_command
        printf "\n"
    done
}

source ./utils/bloqueo_ctrl.sh
activar_bloqueos



./modules/autenticacion.sh
if [[ $? -ne 0 ]]; then
    printf "⛔ Acceso denegado. Cerrando ShellBoxPlay.\n"
    exit 1
fi
main