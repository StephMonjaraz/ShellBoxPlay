# 🖥️ ShellBoxPlay

**ShellBoxPlay** es una terminal interactiva en Bash con autenticación real, comandos personalizados, juegos integrados y reproductor MP3 con interfaz gráfica. Modular y extensible, ideal para usuarios que desean crear su propia shell funcional dentro de un entorno GNU/Linux.


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
- Javier Eduardo Santos Zavala.

---

## 📄 Licencia

MIT License  
Copyright (c) 2025

Se concede permiso, libre de cargos, a cualquier persona que obtenga una copia de este software y archivos de documentación asociados (el "Software"), para tratar el Software sin restricción, incluyendo sin limitación los derechos a usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender copias del Software, y permitir a las personas a quienes se les proporcione el Software que lo hagan, sujeto a las siguientes condiciones:

El aviso de copyright anterior y este aviso de permiso se incluirán en todas las copias o partes sustanciales del Software.

**EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O IMPLÍCITA, INCLUYENDO PERO NO LIMITADO A GARANTÍAS DE COMERCIALIZACIÓN, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN.  
EN NINGÚN CASO LOS AUTORES O TITULARES DEL COPYRIGHT SERÁN RESPONSABLES DE NINGUNA RECLAMACIÓN, DAÑO U OTRA RESPONSABILIDAD, YA SEA EN UNA ACCIÓN DE CONTRATO, AGRAVIO O DE OTRO MODO, QUE SURJA DE O EN CONEXIÓN CON EL SOFTWARE O EL USO U OTROS TRATOS EN EL SOFTWARE.**
