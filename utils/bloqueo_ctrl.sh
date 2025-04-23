#!/bin/bash

# utils/bloqueo_ctrl.sh
# Evita que ShellBoxPlay se cierre con Ctrl+C o Ctrl+Z


activar_bloqueos() {
    trap '' SIGINT
    trap '' SIGTSTP
    trap '' SIGQUIT
}

