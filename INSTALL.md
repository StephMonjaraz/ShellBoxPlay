# INSTALL.md

Esta es la guía para instalar y configurar correctamente el proyecto **ShellBoxPlay**.

## 🧾 Requisitos previos
- Distribución GNU/Linux (preferentemente Debian-based)
- Permisos de ejecución para scripts
- Tener instalado `mpg123`

## 📥 Clonar el repositorio
```bash
git clone https://github.com/StephMonjaraz/ShellBoxPlay.git
cd ShellBoxPlay
```

## 🧰 Crear entorno virtual (opcional)
```bash
sudo apt install virtualenv
virtualenv shell_env
source shell_env/bin/activate
```

## 🔧 Instalar dependencias
```bash
sudo apt install mpg123
```

## ⚙️ Configurar el entorno
```bash
chmod +x *.sh comandos/*.sh juegos/*.sh reproductor/*.sh
```

## ▶️ Ejecutar el proyecto
```bash
./main.sh
```

## ❗ Problemas comunes
- `Permission denied`: Usa `chmod +x`.
- `mpg123: command not found`: Puedes asegurarte instalandolo manualmente.
- `No se puede salir del shell`: Debes usar el comando `salir`, ya que Ctrl+C y Ctrl+Z están bloqueados.

## 🆘 Soporte
Envíame un mensaje directo vía GitHub o Telegram. Siempre estoy feliz de poder ayudar. 💙