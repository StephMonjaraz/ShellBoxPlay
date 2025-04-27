#!/bin/bash
# juego.sh - Juego gato

# Este script implementa un juego interactivo de gato en Bash puro.
# Dos jugadores (X y O) alternan turnos para llenar un tablero de 3x3.
# El objetivo es formar una línea horizontal, vertical o diagonal con el mismo símbolo.


limpiar_pantalla() {
    printf "\033c"
}





pausa() {
    local duracion=$1
    local inicio=$SECONDS
    while (( SECONDS - inicio < duracion )); do :; done
}

# ---------------------------- Variables del tablero ---------------------------- #
G1=" " ; G2=" " ; G3=" "
G4=" " ; G5=" " ; G6=" "
G7=" " ; G8=" " ; G9=" "






draw_board() {
    echo
    echo "   $G1 |   $G2 |  $G3 "
    echo "-----+-----+-----"
    echo "   $G4 |   $G5 |  $G6 "
    echo "-----+-----+-----"
    echo "   $G7 |   $G8 |  $G9 "
    echo
}

tablero() {
    echo
    echo "   1 |  2 |  3 "
    echo "-----+-----+-----"
    echo "   4 |  5 |  6 "
    echo "-----+-----+-----"
    echo "   7 |  8 |  9 "
    echo
}

get_input() {
    while true; do
        echo
        echo "Jugador 1, elige tu ficha (X o O): "
        read choice1



        if [[ "$choice1" != "X" && "$choice1" != "O" ]]; then
            echo
            echo "Ingreso una ficha incorrecta. Solo puede elegir entre X o O."
            pausa 2
            continue
        fi

        if [[ "$choice1" == "X" ]]; then
            choice2="O"
        else
            choice2="X"
        fi

        limpiar_pantalla
        echo
        echo "Jugador 1 ha elegido: $choice1"
        echo "Jugador 2 usará: $choice2"
        pausa 2
        break
    done
}

make_move() {
    limpiar_pantalla
    draw_board

    echo "Jugador $turn, elige una posición (1-9): "
    read move

    if [[ "$move" == "tablero" ]]; then
        limpiar_pantalla
        echo "Aquí tienes las posiciones del tablero:"
        tablero
        echo "Presiona Enter para continuar."
        read
        return 1
    fi

    if ! [[ "$move" =~ ^[1-9]$ ]]; then
        echo
        echo "Movimiento inválido. Elige una posición entre 1 y 9."
        pausa 2
        return 1
    fi

    case "$move" in

        1) [[ "$G1" == " " ]] && G1="$turn" || ocupado=true ;;

        2) [[ "$G2" == " " ]] && G2="$turn" || ocupado=true ;;
        3) [[ "$G3" == " " ]] && G3="$turn" || ocupado=true ;;
        4) [[ "$G4" == " " ]] && G4="$turn" || ocupado=true ;;
        5) [[ "$G5" == " " ]] && G5="$turn" || ocupado=true ;;
        6) [[ "$G6" == " " ]] && G6="$turn" || ocupado=true ;;
        7) [[ "$G7" == " " ]] && G7="$turn" || ocupado=true ;;
        8) [[ "$G8" == " " ]] && G8="$turn" || ocupado=true ;;
        9) [[ "$G9" == " " ]] && G9="$turn" || ocupado=true ;;
    esac

    if [[ "$ocupado" == "true" ]]; then
        echo "La posición ya está ocupada."
        pausa 2
        ocupado=false
        return 1
    fi

    limpiar_pantalla
    draw_board
}

check_winner() {
    local win_msg="Jugador %s ha ganado!\n"

    # Filas
    [[ "$G1" == "$G2" && "$G2" == "$G3" && "$G1" != " " ]] && printf "$win_msg" "$G1" && return 0
    [[ "$G4" == "$G5" && "$G5" == "$G6" && "$G4" != " " ]] && printf "$win_msg" "$G4" && return 0
    [[ "$G7" == "$G8" && "$G8" == "$G9" && "$G7" != " " ]] && printf "$win_msg" "$G7" && return 0
    # Columnas
    [[ "$G1" == "$G4" && "$G4" == "$G7" && "$G1" != " " ]] && printf "$win_msg" "$G1" && return 0
    [[ "$G2" == "$G5" && "$G5" == "$G8" && "$G2" != " " ]] && printf "$win_msg" "$G2" && return 0
    [[ "$G3" == "$G6" && "$G6" == "$G9" && "$G3" != " " ]] && printf "$win_msg" "$G3" && return 0
    # Diagonales
    [[ "$G1" == "$G5" && "$G5" == "$G9" && "$G1" != " " ]] && printf "$win_msg" "$G1" && return 0
    [[ "$G3" == "$G5" && "$G5" == "$G7" && "$G3" != " " ]] && printf "$win_msg" "$G3" && return 0

    # Empate
    if [[ "$G1" != " " && "$G2" != " " && "$G3" != " " &&
          "$G4" != " " && "$G5" != " " && "$G6" != " " &&
          "$G7" != " " && "$G8" != " " && "$G9" != " " ]]; then
        echo "El juego ha terminado en empate!"
        return 0
    fi
    return 1
}

turn() {
    [[ "$turn" == "X" ]] && turn="O" || turn="X"
    limpiar_pantalla
    echo
    echo "Es el turno de $turn"
    
    pausa 1
}

main() {
    limpiar_pantalla
    echo
    echo "🎮 Bienvenido al juego de gato!"
    echo
    echo "Este es el tablero con las posiciones:"
    tablero

    get_input
    turn="$choice1"
    echo
    echo "Comencemos el juego. Para ver el tablero de referencia escribe 'tablero' en tu turno."
    pausa 2

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

    draw_board
    if check_winner; then
        printf "🎉 ¡Felicidades! El jugador %s ha ganado el juego.\n" "$turn"
    else
        echo "El juego ha terminado en empate."
    fi
    echo "Gracias por jugar 🕹️"
}

main