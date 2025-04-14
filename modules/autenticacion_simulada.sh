#!/bin/bash
#shebang
# ************** PRUEBA FALLIDA (momentáneamente) **************
#Simulador de autenticación para ShellBoxPlay.
#Aquí simularemos un proceso de autenticación de usuario con validaciones y almacenamiento seguro de credenciales.
#Las credenciales se almacenarán en un archivo de texto llamado credenciales.txt.

# Permitiremos solo 3 intentos.
max_attempts=3 
attempts=0 #inicializamos el contador de intentos
credentials_file="$(dirname "$0")/credenciales.txt" #formato: usuario:contraseña

#Con la condición verificamos si el archivo existe.
if [ ! -f "$credentials_file" ]; then # ! niega la condición.
    echo "⛔ Error: Archivo de credenciales no encontrado ($credentials_file)."
    exit 1 # 1 indica un error.  
fi

#Función para mostrar la bienvenida
show_welcome() {
    clear #limpia la pantalla
    echo "🐉 Hola, bienvenidx a ShellBoxPlay 🐉"
    echo #salto de línea
}

#Bucle para que tengamos el control y permitamos solo 3 intentos
while [ $attempts -lt $max_attempts ]; do #Mientras los intentos sean menores al máximo permitido...
    show_welcome #Muestra la bienvenida al inicio de cada intento

    #Si no es el primer intento, muestra un mensaje de error
    if [ $attempts -gt 0 ]; then
        echo "Usuario o contraseña incorrectos. Por favor, inténtelo de nuevo."
        echo
    fi

    echo -n "👤 Usuario: "
    read entered_username

    #verificamos si el nombre de usuario está vacío
    if [ -z "$entered_username" ]; then
        echo "❌ El nombre de usuario no puede estar vacío."
        ((attempts++))
        continue
    fi

    #contraseña, entrada oculta.
    read -s -p "🔑 Contraseña: " entered_password # -s significa silence y -p significa prompt (mensaje)
    echo

    #verificamos si la contraseña está vacía
    if [ -z "$entered_password" ]; then # -z verifica si la cadena está vacía, es decir, longitud cero.
        echo "❌ La contraseña no puede estar vacía."
        ((attempts++)) #incrementamos los intentos
        continue
    fi

    #para la autenticación.
    if grep -q "^$entered_username:$entered_password$" "$credentials_file"; then # -q significa silencioso, no muestra la salida.
        echo
        echo "✅ Autenticación exitosa. Bienvenido, $entered_username."
        export ACTIVE_USER="$entered_username" #exporta la variable para que podamos usarla en otros scripts.
        exit 0
    fi

    #incrementamos los intentos si la autenticación falla
    ((attempts++))
done

#si el usuario alcanza el máximo de intentos, cerramos ShellBoxPlay.
clear
echo
echo "🖥️  🐉 ShellBoxPlay 🐉 🖥️"
echo
echo "⛔ Demasiados intentos. Cerrando ShellBoxPlay..."
echo
exit 1