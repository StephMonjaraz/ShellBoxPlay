# 🖥️ ShellBoxPlay

## 🌐 English Version

**ShellBoxPlay** is an interactive Bash-based terminal with real user authentication, custom commands, built-in games, and an MP3 player with a graphical interface. Modular and extensible, it's ideal for users seeking to build their own functional shell environment within GNU/Linux systems.

Designed as a practical exercise in pure Bash scripting, it strengthens terminal development and scripting skills.

---

## 🚀 Main Features

- 🔐 Login using real host system users.
- 💻 Custom command-line interface displaying user and directory info.
- ⚙️ Built-in Bash commands:
  - `ayuda` – list of available commands
  - `infosis` – system info (RAM, architecture, version)
  - `fecha` – current date and time without using `date`
  - `buscar` – file search in specific directories
  - `creditos` – developer information
  - `salir` – secure shell exit (blocks Ctrl+C and Ctrl+Z)
- 🎮 Console games (Tic-Tac-Toe and Hangman).
- 🎵 MP3 player with graphical interface using `mpg123`.

---

## 🧩 Project Structure

The project is modular. Each function is implemented in a separate `.sh` script, organized by purpose (commands, games, player), allowing for maintainability and reusability.

---

## 📥 Installation

```bash
git clone https://github.com/StephMonjaraz/ShellBoxPlay.git
cd ShellBoxPlay
chmod +x *.sh comandos/*.sh juegos/*.sh reproductor/*.sh
./main.sh
```

> ⚠️ Requirements:

> GNU/Linux distribution (preferably Debian-based)

> Permission to execute Bash scripts

> mpg123 installed (you’ll be prompted to install it if missing)

📝 **Note:** The shell can only be exited using the salir command. Ctrl+C and Ctrl+Z are blocked to prevent forced termination.

---

## 🛠️ Technical Notes
-Automatically checks for mpg123 and prompts installation.

-salir is the only valid exit method.

- Commands like date and neofetch were manually recreated in Bash.
---

## 🧠 Credits
** Developed by: **

-Jessica Stephanie Garcia Monjaraz

---

## 📄 License

MIT License  
© 2025 Jessica Stephanie Garcia Monjaraz

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

**THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.**      

---






<br><br>




# 🖥️ ShellBoxPlay

**ShellBoxPlay** es una terminal interactiva en Bash con autenticación real, comandos personalizados, juegos integrados y reproductor MP3 con interfaz gráfica. Modular y extensible, ideal para usuarios que desean crear su propia shell funcional dentro de un entorno GNU/Linux.
Está diseñado para el estudio y la aplicación práctica de comandos en Bash puro, reforzando habilidades de programación en entornos de consola.


---

## 🚀 Características principales

- 🔐 Inicio de sesión con usuarios reales del sistema anfitrión.
- 💻 Línea de comandos personalizada con información de usuario y directorio.
- ⚙️ Comandos propios implementados en Bash:
  - `ayuda`: lista de comandos disponibles.
  - `infosis`: información del sistema (RAM, arquitectura, versión).
  - `fecha`: fecha y hora sin usar `date`.
  - `buscar`: búsqueda de archivos en directorios específicos.
  - `creditos`: información del desarrollador.
  - `salir`: comando para cerrar la terminal (bloquea Ctrl+C y Ctrl+Z).
- 🎮 Juegos integrados ejecutables desde consola (Gato o Ahorcado).
- 🎵 Reproductor MP3 con GUI basada en `mpg123`.

---

## 🧩 Estructura del proyecto

El proyecto está organizado de forma modular, con scripts `.sh` separados para cada función. Esto permite un desarrollo más claro, mantenible y reutilizable.

---

## 📥 Instalación

```bash
git clone https://github.com/StephMonjaraz/ShellBoxPlay.git
cd ShellBoxPlay
chmod +x *.sh comandos/*.sh juegos/*.sh reproductor/*.sh
./main.sh
```

> ⚠️ **Requisitos previos:**
> - Distribución GNU/Linux (preferentemente basada en Debian).
> - Permisos para ejecutar scripts Bash.
> - Tener instalado `mpg123` (el sistema preguntará si deseas instalarlo si no está presente).

📝 **Nota:** El programa solo puede cerrarse con el comando `salir`. Se bloquean `Ctrl+C` y `Ctrl+Z` para evitar salidas forzadas.

---

## 🛠️ Notas técnicas

- El programa detecta si `mpg123` está instalado y ofrece instalarlo si no lo está.
- El comando `salir` es la única forma válida de cerrar la terminal.
- Comandos como `date` y `neofetch` han sido reemplazados por lógica propia en Bash.

---

## 🧠 Créditos

**Desarrollado por:**

- Jessica Stephanie Garcia Monjaraz. 

---

## 📄 Licencia

MIT License  
Copyright (c) 2025

Se concede permiso, libre de cargos, a cualquier persona que obtenga una copia de este software y archivos de documentación asociados (el "Software"), para tratar el Software sin restricción, incluyendo sin limitación los derechos a usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender copias del Software, y permitir a las personas a quienes se les proporcione el Software que lo hagan, sujeto a las siguientes condiciones:

El aviso de copyright anterior y este aviso de permiso se incluirán en todas las copias o partes sustanciales del Software.

**EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O IMPLÍCITA, INCLUYENDO PERO NO LIMITADO A GARANTÍAS DE COMERCIALIZACIÓN, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN.  
EN NINGÚN CASO LOS AUTORES O TITULARES DEL COPYRIGHT SERÁN RESPONSABLES DE NINGUNA RECLAMACIÓN, DAÑO U OTRA RESPONSABILIDAD, YA SEA EN UNA ACCIÓN DE CONTRATO, AGRAVIO O DE OTRO MODO, QUE SURJA DE O EN CONEXIÓN CON EL SOFTWARE O EL USO U OTROS TRATOS EN EL SOFTWARE.**
