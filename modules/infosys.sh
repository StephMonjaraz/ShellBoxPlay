#!/bin/bash
#shebang

# Este script proporciona información del sistema de forma portable y sin comandos externos.
# Su objetivo es mostrar detalles como la memoria RAM total, la arquitectura del sistema y 
# la versión del sistema operativo. Todo esto se realiza utilizando únicamente Bash puro y 
# accediendo directamente a archivos del sistema como /proc/meminfo, /proc/cpuinfo y /etc/os-release.

memoria="No disponible" # En caso de que falle
if [ -r /proc/meminfo ]; then
    while IFS= read -r linea; do
        if [[ "$linea" == MemTotal:* ]]; then # Si se encuentra la línea que contiene MemTotal
            if [[ "$linea" =~ ([0-9]+) ]]; then
                kb="${BASH_REMATCH[1]}" # Extrae el valor numérico de la memoria
            fi


            if [[ "$kb" =~ ^[0-9]+$ ]]; then # Si es un número
                if [ "$kb" -ge 1048576 ]; then # Si es mayor o igual a 1GB
                    gb=$((kb / 1024 / 1024))
                    memoria="$gb GB"
                elif [ "$kb" -ge 1024 ]; then # Si es mayor o igual a 1MB
                    mb=$((kb / 1024))
                    memoria="$mb MB"
                else
                    mb=$((kb / 1024))
                    memoria="$mb MB"
                fi
                break
            fi
        fi
    done < /proc/meminfo
fi


arquitectura="No disponible" # Por si acaso
if [ -r /proc/cpuinfo ]; then
    while IFS= read -r linea; do
        if [[ "$linea" == flags* ]]; then
            if [[ "$linea" == *" lm "* ]]; then
                arquitectura="64 bits"
            else
                arquitectura="32 bits"
            fi
            break
        fi
    done < /proc/cpuinfo
fi



so="No disponible"
if [ -r /etc/os-release ]; then
    while IFS= read -r linea; do
        if [[ "$linea" == PRETTY_NAME=* ]]; then
            so=${linea#*=}
            so=${so//\"/}
            break
        fi
    done < /etc/os-release
elif [ -r /proc/version ]; then
    read -r so < /proc/version
fi



printf "Información del sistema:\n"
printf "------------------------\n"
printf "Memoria RAM total        : %s\n" "$memoria"
printf "Arquitectura del sistema : %s\n" "$arquitectura"
printf "Versión del SO           : %s\n" "$so"