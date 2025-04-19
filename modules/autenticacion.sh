#!/bin/bash 
#shebang

# Por temas de seguridad, al usuario NO se le mostrará su contraseña.
cantread_password() { #Función para protección de datos.
    unset PASSWORD #tenemos que asegurarnos que la variable PASSWORD esté vacía antes de usarla.
                  #unset elimina el valor de la variable PASSWORD.
    pass="Contraseña: " #en la var pass se guarda el mensaje que se mostrará al usuario. 
    while IFS= read -p "$pass" -r -s -n 1 key; do # es el ciclo que se encarga de ejecutarse mientras el usuario
                                                  # siga escribiendo su contraseña.
        # el carácter (contra) ingresado por el usuario.
        # IFS= evita que los espacios en blanco se eliminen. International Field Separator.
        # p es como un print. solo que aquí le muestra al usuario el contenido de la variable pass.       
        # r desactiva el procesamiento de caracteres especiales como '\'.
        # s oculta la contraseña que ingresa el usuario. 
        # n 1 es para que solo se lea un carácter a la vez.
        if [[ $key == $'\0' ]]; then
            # si no se ingresa nada (Enter), termina la lectura.
            break
        fi
        pass='*' #no se verá la contraseña, solo '*'
        PASSWORD+="$key" #agrega la contraseña a la variable key.
    done
    echo #buenas prácticas de formato limpio.
    echo -n "Presiona Enter para confirmar..."
    read 
}

### HASTA AQUÍ EL ANÁLISIS ###

# Para tener un límite de intentos, le damos al usuario 3 oportunidades.
for try in 1 2 3; do
    echo -n "Usuario: " # con -n se elimina el salto de línea al final.
    read USER # lee el nombre

    # Verificar si el usuario existe
    getent passwd "$USER" > /dev/null
    # getent passwd busca el usuario en la base de datos del sistema.
    # si el usuario no existe, le avisamos al posible usuario y le quedan 2 intentos.
    if [ $? -ne 0 ]; then # el comparador not equal (ne) verifica si el usuario no existe.
        # $? es una variable que guarda el código de salida del último comando ejecutado
        # código de salida 0 éxito. código de salida 1 error.
        echo "❌ El usuario no existe. Intenta de nuevo." 
        continue 
    fi

    cantread_password #se le pide al usuario su contraseña, se llama a la función.

    #ntentar su - con contraseña, expect para interacción
    resultado=$(expect -c "
        spawn su - $USER
        # `spawn` inicia el comando `su - $USER` para cambiar al usuario especificado.
        expect \"Contraseña:\"
        # Espera el mensaje \"Contraseña:\" que indica que el sistema solicita la contraseña.
        send \"$PASSWORD\r\"
        # Envía la contraseña ingresada seguida de un retorno de carro (\r) que es la simulación de
        # presionar Enter.
        expect { # aquí expect espera diferentes resultados.
            \"$USER\" { #aquí solo espera los resultados de las acciones que se realizaron en el sistema.
                exit 0 #autenticación exitosa.
            }
            \"su: Fallo de autenticación\" {
                exit 1 # contraseña incorrecta.
            }
            timeout {
                exit 1 #sistema no responde dentro del tiempo esperado, se considera un fallo.
            }
        }
    ")

    if [ $? -eq 0 ]; then
        # Si el usuario existe (equal 0), la autenticación se logró.
        export USUARIO_ACTIVO="$USER" #guarda al usuario autenticado en una variable de entorno.
                                     #la variable es de entorno para que podamos usarla en otros scripts.
        return 0 
    else
        echo "❌ Contraseña incorrecta." 
    fi
done

#se dieron los 3 intentos, así que termina el script.
echo "Demasiados intentos."
return 1
