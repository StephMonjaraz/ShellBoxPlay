#!/bin/bash
#shebang

#3.- Comando que pueda dar la fecha


# ---------------------------- Fase 2 ----------------------------  #


# ---------------------------- Correciones ----------------------------  #
#No pueden usar comandos que existan de forma predeterminada para usarlos en sus
#comandos solicitados, por ejemplo, no podrán usar date para para un comando que
#muestre la fecha y la hora. Ustedes deberán averiguar cómo realizar dicho comando
#sin hacer uso de otros comandos ya existentes. #

# dpkg.log contiene la fecha asi que usaré el archivo del sistema /var/log/slog debido a problemas con la sincronización
# de la hora del sistema. Este archivo contiene registros del sistema y
# de los servicios que se ejecutan en el sistema. En este caso, me interesa
# buscar la última línea válida que contenga la hora actual del sistema.

# cat /var/log/syslog 

logfile="/var/log/dpkg.log"
ultima_linea=""

# Verificar que el archivo se puede leer
if [ -r "$logfile" ]; then
while IFS= read -r linea; do
# Busca líneas con formato "YYYY-MM-DD HH:MM:SS"
if [[ "$linea" =~ ([0-9]{4})-([0-9]{2})-([0-9]{2})\ ([0-9]{2}) ]]; then
ultima_linea="$linea"
fi
done < "$logfile" # guardamos la última línea que cumplio la condición

# Extraer la fecha si encontramos una línea válida
if [ -n "$ultima_linea" ]; then #verifica que si hay algo en la linea not null
if [[ "$ultima_linea" =~ ([0-9]{4})-([0-9]{2})-([0-9]{2})\ ([0-9]{2}) ]]; then
fecha="${BASH_REMATCH[1]}-${BASH_REMATCH[2]}-${BASH_REMATCH[3]}"
echo "Fecha actual del sistema: $fecha"
else
echo "Lo sentimos, intente nuevamente."
fi

