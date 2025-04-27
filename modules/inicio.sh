#!/bin/bash

green_dark='\033[38;5;28m'     
green_pastel='\033[38;5;120m'  
green_bright='\033[38;5;40m'   
green_yellowish='\033[38;5;82m' 
black='\033[38;5;16m'          
reset='\033[0m'
# Arreglo de colores 
colors=("$green_dark" "$green_pastel" "$green_bright" "$green_yellowish")


# Dimensiones de mi pantalla
cols=142
rows=40

clear

# Número de apariciones 
total_cells=$((cols * rows))
appearances=$((total_cells * 60 / 100))
move_cursor() {
    echo -en "\033[$1;${2}H"
}



for ((i=0; i<$appearances; i++)); do
    row=$((RANDOM % rows + 1))
    col=$((RANDOM % cols + 1))
    
    rand=$((RANDOM % 10))
    if [ $rand -lt 8 ]; then
        color=${colors[$((RANDOM % ${#colors[@]}))]}
        symbol="█"
    else
        color=$black
        symbol=" "
    fi

    move_cursor $row $col
    echo -en "${color}${symbol}${reset}"
    sleep 0.00005
done




move_cursor $((rows+1)) 0
