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


#!/bin/bash
# Script: infosis.sh
# Objetivo: Mostrar información del sistema de forma portable y sin comandos externos

# ---------------------------- Fase 2 ----------------------------  #


# ---------------------------- Correciones ----------------------------  #
#No pueden usar comandos que existan de forma predeterminada para usarlos en sus
#comandos solicitados, por ejemplo, no podrán usar date para para un comando que
#muestre la fecha y la hora. Ustedes deberán averiguar cómo realizar dicho comando
#sin hacer uso de otros comandos ya existentes. #

# ------------ MEMORIA RAM ------------
memoria="No disponible" #en caso de que falle
# condicion de lectura 
if [ -r /proc/meminfo ]; then
    while IFS= read -r linea; #mientras se pueda leer la linea
    do 
        if [[ "$linea" == MemTotal:* ]]; then #si se encuentra la linea que contiene MemTotal
            if [[ "$linea" =~ ([0-9]+) ]]; then
                kb="${BASH_REMATCH[1]}" #BASH_REMATCH es una variable de bash 
                                        #que tiene el resultado de la última expresión
            fi

            if [[ "$kb" =~ ^[0-9]+$ ]]; then # si es un número
                if [ "$kb" -ge 1048576 ]; then #si es mayor o igual a 1GB (greater equal)
                    gb=$((kb / 1024 / 1024))
                    memoria="$gb GB"
                elif [ "$kb" -ge 1024 ]; then #mayor o igual a 1MB 
                    mb=$((kb / 1024))
                    memoria="$mb MB"
                else #mayor a 1MB
                    mb=$((kb / 1024))
                    memoria="$mb MB"
                fi
                break
            fi
        fi
    done < /proc/meminfo #guarda la ultima linea que cumple la condidion del while
fi #fin de la condicion de lectura

# ------------ ARCH DEL SISTEMA ------------
arquitectura="No disponible" #por si acaso

if [ -r /proc/cpuinfo ]; then
    while IFS= read -r linea; 
    do #mientras se pueda leer 
        if [[ "$linea" == flags* ]]; then
            if [[ "$linea" == *" lm "* ]]; then
                arquitectura="64 bits"
            else
                arquitectura="32 bits"
            fi
            break
        fi
    done < /proc/cpuinfo #guarda la última línea que cumple la condición
fi

# ------------ VERSIÓN DEL SO ------------
so="No disponible"

if [ -r /etc/os-release ]; then
    while IFS= read -r linea; 
    do
        if [[ "$linea" == PRETTY_NAME=* ]]; then
            so=${linea#*=}
            so=${so//\"/}
            break
        fi
    done < /etc/os-release
elif [ -r /proc/version ]; then
    read -r so < /proc/version
fi

echo "Información del sistema:"
echo "------------------------"
echo "Memoria RAM total        : $memoria"
echo "Arquitectura del sistema : $arquitectura"
echo "Versión del SO           : $so"
