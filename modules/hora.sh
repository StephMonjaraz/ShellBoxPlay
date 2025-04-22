#!/bin/bash
#shebang

#3.- Comando que pueda dar la hora


# ---------------------------- Fase 2 ----------------------------  #

# ---------------------------- Correciones ----------------------------  #
#No pueden usar comandos que existan de forma predeterminada para usarlos en sus
#comandos solicitados, por ejemplo, no podrán usar date para para un comando que
#muestre la fecha y la hora. Ustedes deberán averiguar cómo realizar dicho comando
#sin hacer uso de otros comandos ya existentes. #

# slog contiene la hora y fecha de los eventos del sistema, asi que
#Usaré el archivo del sistema /var/log/slog debido a problemas con la sincronización
# de la hora del sistema. Este archivo contiene registros del sistema y
# de los servicios que se ejecutan en el sistema. En este caso, me interesa
# buscar la última línea válida que contenga la hora actual del sistema.

# cat /var/log/syslog 

logfile="/var/log/syslog"
ultima_linea=""

# verifica que podemos acceder al archivo
if [ -r "$logfile" ]; then
while IFS= read -r linea; do #-r significa "read"
# damos una condición para el formato si lo cumple, se guarda
if [[ "$linea" =~ [A-Z][a-z]{2}\ +[0-9]{1,2}\ ([0-9]{2}):([0-9]{2}):([0-9]{2}) ]]; then
ultima_linea="$linea"
fi
done < "$logfile" #aqui se guarda la última línea que cumplio la condición

#para imprimir la hora 
if [ -n "$ultima_linea" ]; then #verifica que no este vacia.
if [[ "$ultima_linea" =~ [A-Z][a-z]{2}\ +[0-9]{1,2}\ ([0-9]{2}):([0-9]{2}):([0-9]{2}) ]]; then
hora="${BASH_REMATCH[1]}:${BASH_REMATCH[2]}:${BASH_REMATCH[3]}"
echo "Hora actual del sistema: $hora"
else
echo "Lo sentimos, intente nuevamente."
fi
else
echo "Lo sentimos, intente nuevamente."
fi
else
echo "Lo sentimos, intente nuevamente."
fi
