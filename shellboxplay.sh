#!/bin/bash
#shebang

# ShellBoxPlay - Sistema Modular de la terminal simulada.
#Prueba 1.

# 👾 🎀 Script principal de ShellBoxPlay 👾 🎀

# 1. Iniciamos confirmando que existe el usuario con el módulo de autenticación simulada
source modules/autenticacion_simulada.sh #source es un comando que llama a otro script y lo ejecuta en el contexto actual. 
                                         #es como si copiáramos y pegáramos el contenido del script llamado aquí. 
                                         #permite que las variables y funciones definidas en el script llamado estén disponibles en el script que llama.

#si no se confirma al usuario, cierra els istema.
if [ $? -ne 0 ]; then
    echo "❌ Autenticación fallida. Cerrando sistema..."
    exit 1
fi

# 2. Llamamos al script de bloqueo de señales (Ctrl+C, Ctrl+Z)
source utils/bloqueo_ctrl.sh

# 3. Bucle interactivo tipo terminal personalizada
while true; do
    #prompt personalizado con el usuario activo y ruta actual
    echo -n "💻 $USUARIO_ACTIVO@$(pwd) $ "
    read -r comando #lee el comando ingresado
#usamos un case para ver que desea hacer el usuario.
    # Comprobamos si el comando es uno de los módulos personalizados
    case $comando in
        ayuda) source modules/ayuda.sh ;;
        infosis) source modules/infosis.sh ;;
        fecha) source modules/fecha_hora.sh ;;
        buscar) source modules/buscar_archivo.sh ;;
        creditos) source modules/creditos.sh ;;
        juego) source modules/juego.sh ;;
        reproductor) source modules/reproductor.sh ;;
        salir)
            echo "Hasta pronto... 💫 "
            break
            ;;
        *)
            #si  no es uno de nuestros comandos personalizado, intentar ejecutarlo como comando del sistema
            eval "$comando"
            ;;
    esac
done
