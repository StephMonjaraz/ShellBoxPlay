#!/bin/bash

# Este script proporciona información del sistema de forma portable y sin comandos externos.
# Su objetivo es mostrar detalles como la memoria RAM total, la arquitectura del sistema y 
# la versión del sistema operativo. Todo esto se realiza utilizando únicamente Bash puro y 
# accediendo directamente a archivos del sistema como /proc/meminfo, /proc/cpuinfo y /etc/os-release.

# ---------------------------- MEMORIA RAM ---------------------------- #
memoria="No disponible" # por si no se puede leer la memoria
if [ -r /proc/meminfo ]; then
    while IFS= read -r linea; do
        if [[ "$linea" == MemTotal:* && "$linea" =~ ([0-9]+) ]]; then
            kb="${BASH_REMATCH[1]}" # Extrae el valor numérico de la memoria
            if [ "$kb" -ge 1048576 ]; then
                gb=$((kb / 1024 / 1024)) #pasa de KB a MB y luego a GB
                memoria="$gb GB"
            elif [ "$kb" -ge 1024 ]; then
                mb=$((kb / 1024)) # pasa de KB a MB
                memoria="$mb MB"
            else
                memoria="$kb KB"
            fi
            break
        fi
    done < /proc/meminfo
fi

# ---------------------------- ARQUITECTURA DEL SISTEMA ---------------------------- #
arquitectura="No disponible" # por si no se puede leer la arquitectura
if [ -r /proc/cpuinfo ]; then
    while IFS= read -r linea; do
        if [[ "$linea" == flags* ]]; then
            if [[ "$linea" == *" lm "* ]]; then #verifica si hay "lm" en la línea, mas no en una palabra
                arquitectura="64 bits"
            else
                arquitectura="32 bits"
            fi
            break
        fi
    done < /proc/cpuinfo
fi

# ---------------------------- VERSIÓN DEL SISTEMA OPERATIVO ---------------------------- #
so="No disponible" # por si no se puede leer la versión del SO
if [ -r /etc/os-release ]; then
    while IFS= read -r linea; do #si puede leer el archivo /etc/os-release
        if [[ "$linea" == PRETTY_NAME=* ]]; then
            so=${linea#*=} # ${variable#patrón} variable con eliminacion de prefijo
            so=${so//\"/} 
            break
        fi
    done < /etc/os-release
elif [ -r /proc/version ]; then # si no puede leer el archivo /etc/os-release, lee /proc/version
    read -r so < /proc/version
fi


printf "Información del sistema:\n"
echo "------------------------"
printf "Memoria RAM total        : %s\n" "$memoria"
printf "Arquitectura del sistema : %s\n" "$arquitectura"
printf "Versión del SO           : %s\n" "$so"