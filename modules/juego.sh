#!/bin/bash
#shebang

#!/bin/bash
# juego.sh - Juego gato

#¿Qué quiero lograr con este script? Un juego interactivo que le permita al 
# usuario la experiencia completa de jugar gato.
#¿Cuál es el comportamiento esperado del juego? dos jugadores O y X, 
# llenan los espacios de un tablero de 3×3 alternadamente,
# el objetivo es formar una línea horizontal, vertical o 
#diagonal sólo con los símbolos iguales
#¿Qué información debe proporcionar el usuario? la posición en la que desea 
# poner O o X
#¿Qué se debe mostrar en pantalla durante el juego? se debe poner O o X
# en la posicion en la que el jugador eligió.
#¿Cuándo debe terminar el juego? cuando algún jugar haya logrado establecer 
# una linea horizontal o diagonal.

# ---------------------------- Variables ----------------------------  #
# Entrada: El usuario dará la posición en la que desea poner O o X
      # Condiciones: Verificar que la casilla no este ocupada, que este entre el rango de G1-G9 y que sea el turno del jugador.
# Salida: Tablero actualizado con O y X colocados. Un mensaje que indique de que jugador es el turno. Un mensaje que diga quien ganó el juego. 

# Variables principales:
# turn: para saber de quien es el turno.("O" o "X")
# winner: indica si ya gano alguien (true/false)
# occupied_count: cuenta cuantos movimientos se han hecho (de 0 a 9)
# choice: almacena el número (1-9) que el jugador elige
# valid_move: bandera para validar si el movimiento es permitido

# Variables auxiliares:
# symbol_O: podría almacenar "O"
# symbol_X: podría almacenar "X"
# Estas se pueden usar para personalizar visualmente el tablero.

# ---------------------------- Fase 1 ----------------------------  #

# ---------------------------- Funciones ----------------------------

G1=" " ; G2=" " ; G3=" "
G4=" " ; G5=" " ; G6=" "
G7=" " ; G8=" " ; G9=" "

draw_board(){
# Para poder imprimir al tablero en pantalla con las casillas actualizadas
echo
echo "   $G1 |   $G2 |  $G3 "
echo "-----+-----+-----"
echo "   $G4 |   $G5 |  $G6 "
echo "-----+-----+-----"
echo "   $G7 |   $G8 |  $G9 "
echo
}

tablero(){
echo
echo "   1 |  2 |  3 "
echo "-----+-----+-----"
echo "   4 |  5 |  6 "
echo "-----+-----+-----"
echo "   7 |  8 |  9 "
echo
}

get_input(){
# Le pedirá al jugador que seleccione una posición y verifica que sea valido el movimiento
while true; do
echo
echo "Jugador 1, elige tu ficha (X o O):"
read choice1

if [[ "$choice1" != "X" && "$choice1" != "O" ]]; then
echo
echo "Ingreso una ficha incorrecta"
echo "Solo puede elegir entre las fichas X o O"
sleep 2 #para que de tiempo de ver el mensaje
continue
fi

if [[ "$choice1" == "X" ]]; then
choice2="O"
else
choice2="X"
fi
clear
echo
echo "Jugador 1 ha elegido: $choice1"
echo
echo "Jugador 2 usará: $choice2"
sleep 2 #para que de tiempo de ver el mensaje
break
done
}

make_move(){
# le pide al jugador actual que realice un movimiento
clear
draw_board
echo "Jugador $turn, elige una posición (1-9):"
read move

# Verifica si el jugador quiere ver el tablero de referencia
if [[ "$move" == "tablero" ]]; then
clear
echo "Aquí tienes las posiciones del tablero:"
tablero
echo "Presiona Enter para continuar."
read
return 1
fi

# Verifica si el valor ingresado es un número entre 1 y 9
if ! [[ "$move" =~ ^[1-9]$ ]]; then
echo
echo "Tu movimiento no es válido, elige una posición entre 1 y 9"
sleep 2
return 1
fi

# Verifica si la posición está ocupada y coloca la ficha si está libre
if [[ "$move" -eq 1 && "$G1" == " " ]]; then
G1="$turn"
elif [[ "$move" -eq 2 && "$G2" == " " ]]; then
G2="$turn"
elif [[ "$move" -eq 3 && "$G3" == " " ]]; then
G3="$turn"
elif [[ "$move" -eq 4 && "$G4" == " " ]]; then
G4="$turn"
elif [[ "$move" -eq 5 && "$G5" == " " ]]; then
G5="$turn"
elif [[ "$move" -eq 6 && "$G6" == " " ]]; then
G6="$turn"
elif [[ "$move" -eq 7 && "$G7" == " " ]]; then
G7="$turn"
elif [[ "$move" -eq 8 && "$G8" == " " ]]; then
G8="$turn"
elif [[ "$move" -eq 9 && "$G9" == " " ]]; then
G9="$turn"
else
echo
echo "La posición ya está ocupada."
sleep 2
return 1
fi
clear 
draw_board
}

check_winner(){
#chea si ya hay alguna combinación valida (filas, columnas o diagonales)
#filas
if [[ "$G1" == "$G2" && "$G2" == "$G3" && "$G1" != " " ]]; then
echo "Jugador $G1 ha ganado!"
return 0
elif [[ "$G4" == "$G5" && "$G5" == "$G6" && "$G4" != " " ]]; then
echo "Jugador $G4 ha ganado!"
return 0
elif [[ "$G7" == "$G8" && "$G8" == "$G9" && "$G7" != " " ]]; then
echo "Jugador $G7 ha ganado!"
return 0
fi
#columnas
if [[ "$G1" == "$G4" && "$G4" == "$G7" && "$G1" != " " ]]; then
echo "Jugador $G1 ha ganado!"
return 0
elif [[ "$G2" == "$G5" && "$G5" == "$G8" && "$G2" != " " ]]; then    
echo "Jugador $G2 ha ganado!"
return 0
elif [[ "$G3" == "$G6" && "$G6" == "$G9" && "$G3" != " " ]]; then
echo "Jugador $G3 ha ganado!"
return 0
fi
#diagonales
if [[ "$G1" == "$G5" && "$G5" == "$G9" && "$G1" != " " ]]; then
echo "Jugador $G1 ha ganado!"
return 0
elif [[ "$G3" == "$G5" && "$G5" == "$G7" && "$G3" != " " ]]; then
echo "Jugador $G3 ha ganado!"
return 0
fi
#si no hay ganador
if [[ "$G1" != " " && "$G2" != " " && "$G3" != " " && "$G4" != " " && "$G5" != " " && "$G6" != " " && "$G7" != " " && "$G8" != " " && "$G9" != " " ]]; then
echo "El juego ha terminado en empate!"
return 0
fi
return 1   
}

turn(){
#Cambia el turno entre "O" y "X"
if [[ "$turn" == "X" ]]; then
turn="O"
else
turn="X"
fi
clear
echo
echo "Es el turno de $turn"
sleep 1
}

main(){
clear
echo
echo "Bienvenido al juego de gato! Esperamos que te diviertas!"
echo
echo "Este es el tablero con el que jugarás, por favor recuerda las posiciones:"
tablero

get_input
turn="$choice1"
echo "Si en algún momento deseas ver el tablero nuevamente, solo escribe 'tablero' y presiona enter."
echo
echo "Comencemos el juego!"
sleep 2

while true; do
draw_board
while true; do
make_move && break
done
if check_winner; then
break
fi
turn
done

draw_board  # muestra el tablero final
if check_winner; then
echo "¡Felicidades! El jugador $turn ha ganado el juego."
else
echo "El juego ha terminado en empate."
fi
echo "Gracias por jugar!"
}
main