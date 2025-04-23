#!/bin/bash
# Reproductor MP3 mejorado

# Configuración
MUSIC_DIR="$HOME/Música" #Carpeta donde estan las canciones en formato mp3
CURRENT_SONG=""  #Almacena la canción actual
PLAYER_PID=0  #Almacena ID del reproductor, para poder detenerlo
CURRENT_INDEX=-1 #Indice de la cancion actual
SONGS=() #Guarda las canciones encontradas en la carpeta

# Colores usados en el reproductor
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'  #No color

# Función para verificar que mpg123 este instalado, si no, se instala
check_mpg123() {
    if ! command -v mpg123 &> /dev/null; then
        echo -e "${RED}mpg123 no está instalado.${NC}"
        read -p "¿Deseas instalar mpg123? [s/N]: " install_choice
        if [[ "$install_choice" =~ [sS] ]]; then
            echo "Instalando mpg123..."
            sudo apt-get install -y mpg123
            return $?
        else
            return 1
        fi
    fi
    return 0
}

# Función para cargar canciones de la carpeta $HOME/Música
load_songs() {
    mapfile -t SONGS < <(find "$MUSIC_DIR" -type f \( -iname "*.mp3" -o -iname "*.MP3" \))
    if [ ${#SONGS[@]} -eq 0 ]; then
        echo -e "${RED}No se encontraron canciones en $MUSIC_DIR${NC}"
        stty sane
        exit 1
    fi
}

# Función para reproducir canción por índice, usando mpg123
play_index() {
    [ $PLAYER_PID -ne 0 ] && kill $PLAYER_PID 2>/dev/null
    CURRENT_SONG="${SONGS[$CURRENT_INDEX]}"
    echo -e "\n${GREEN}---------------------------------------------------------------------------------------"
    echo -e "\n${GREEN}Reproduciendo: ${CURRENT_SONG##*/}${NC}"
    echo -e "\n${GREEN}---------------------------------------------------------------------------------------"
    mpg123 -C "$CURRENT_SONG" > /dev/null 2>&1 &  #Reproduce la cancion y no muestra los mensajes de mpg123
    PLAYER_PID=$!
}

# Función para seleccionar canción, muestra una lista con las canciones
select_song() {
    echo -e "\n${BLUE}Canciones disponibles:${NC}"
    for i in "${!SONGS[@]}"; do
        echo "$((i+1)). ${SONGS[$i]##*/}"
    done

    echo -ne "\n${YELLOW}Selecciona una canción (1-${#SONGS[@]}): ${NC}"
    read -r choice

    if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#SONGS[@]} )); then
        CURRENT_INDEX=$((choice - 1))
        play_index
    else
        echo -e "${RED}Selección inválida${NC}"
        stty sane
        return 1
    fi
}

# Menú principal, bucle infinito
main_menu() {
    while true; do
    echo -e "\n ---------------------------------------------------------------------------------------"
        echo  "🐉 Hola, bienvenidx al reproductor MP3 de ShellBoxPlay 🐉"  
        echo "👾 Seleccione alguna de las siguientes opciones 👾"
 echo -e " ---------------------------------------------------------------------------------------"

        echo -e "\n${BLUE}1. Reproducir canción"
        echo "2. Detener reproducción"
        echo "3. Siguiente canción"
        echo "4. Canción anterior"
        echo -e "${RED}0. Salir${NC}"
        echo -ne "${YELLOW}Selecciona una opción: ${NC}"

        read -r option
        case $option in
            1) select_song;;
            2)
                if [ $PLAYER_PID -ne 0 ]; then
                    kill $PLAYER_PID
                    PLAYER_PID=0
                    stty sane
                fi
                ;;
            3)
                if (( CURRENT_INDEX >= 0 )); then
                    CURRENT_INDEX=$(( (CURRENT_INDEX + 1) % ${#SONGS[@]} ))
                    play_index
                else
                    echo -e "${RED}Primero selecciona una canción.${NC}"
                fi
                ;;
            4)
                if (( CURRENT_INDEX >= 0 )); then
                    CURRENT_INDEX=$(( (CURRENT_INDEX - 1 + ${#SONGS[@]}) % ${#SONGS[@]} ))
                    play_index
                else
                    echo -e "${RED}Primero selecciona una canción.${NC}"
                fi
                ;;
            0)
                [ $PLAYER_PID -ne 0 ] && kill $PLAYER_PID
                stty sane
                break
                ;;
            *)
                echo -e "${RED}Opción inválida, intente otra opción${NC}"
                ;;
        esac
    done
}

# Inicio
if check_mpg123; then
    if [ ! -d "$MUSIC_DIR" ]; then
        echo -ne "${YELLOW}Introduce la ruta de tu música: ${NC}"
        read -r MUSIC_DIR
        if [ ! -d "$MUSIC_DIR" ]; then
            echo -e "${RED}Ruta inválida${NC}"
            stty sane
            exit 1
        fi
    fi

    load_songs
    main_menu
else
    echo -e "${RED}El reproductor requiere mpg123. Saliendo...${NC}"
    stty sane
    exit 1
fi