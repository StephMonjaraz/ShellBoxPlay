#!/bin/bash

# Este script proporciona un sistema de autenticación para ShellBoxPlay. 
# Solicita al usuario un nombre de usuario del sistema anfitrión y, si es válido, 
# verifica su contraseña utilizando un método seguro. 
# El objetivo es autenticar contra usuarios reales sin requerir permisos de superusuario ni usar sudo.
# Los intentos fallidos se registran en un archivo de log para auditoría.

log_file="$HOME/.shellboxplay_auth.log"
max_intentos=3
intentos=1
usuario_validado=false
username=""


while [ $intentos -le $max_intentos ]; do
    printf "\n"
    


    #si aún no se valida el usuario, lo pedimos
    if [ "$usuario_validado" = false ]; then
        printf "👤 Ingresa tu nombre de usuario: "
        read username
    fi

    printf "🔑 Contraseña: "
    stty -echo
    read password
    stty echo
    printf "\n"

    # Verifica si el usuario existe
    user_exists=false
    if [ -r /etc/passwd ]; then
        while IFS=: read -r usr _; do
            if [[ "$usr" == "$username" ]]; then
                user_exists=true
                break
            fi


        done < /etc/passwd
    fi

    # checa combinación
    if [ "$user_exists" = false ]; then
        printf "❌ Usuario '%s' no existe.\n" "$username"
        printf "[sin-fecha] Usuario inexistente: %s (intento %d)\n" "$username" "$intentos" >> "$log_file"
        usuario_validado=false
    else


        #si el usuario existe, probamos contraseña
        printf "%s\n" "$password" | su "$username" -c "true" >/dev/null 2>&1

        if [ $? -eq 0 ]; then
            printf "\n✅ Autenticación exitosa. ¡Bienvenido/a %s!\n" "$username"
            printf "[sin-fecha] Usuario autenticado: %s\n" "$username" >> "$log_file"
            sleep 1
            clear

            exit 0
           


        else
            printf "❌ Contraseña incorrecta para el usuario '%s'.\n" "$username"
            printf "[sin-fecha] Contraseña incorrecta para usuario: %s (intento %d)\n" "$username" "$intentos" >> "$log_file"
            usuario_validado=true  # El usuario  existe, no se vuelve a a pedir
        fi
    fi

    intentos=$((intentos + 1))
    printf "\n"
done
#si se exceden los intentos permitidos
printf "Demasiados intentos fallidos. Acceso denegado.\n"
printf "[sin-fecha] Usuario bloqueado tras %d intentos\n" "$max_intentos" >> "$log_file"
exit 1