#!/bin/bash

echo "Configurador de cuenta de correo para Mutt"

read -p "Correo (ej: juan@docker.local): " correo
read -sp "Contraseña: " contrasena
echo
read -p "Nombre completo: " nombre

# Crear carpeta si no existe
mkdir -p ~/.mutt

# Generar el archivo de configuración
cat > ~/.mutt/muttrc <<EOF
set imap_user = '$correo'
set imap_pass = '$contrasena'
set from = '$correo'
set realname = '$nombre'

set folder = "imaps://mailserver"
set spoolfile = "+INBOX"
set smtp_url = "smtp://$correo@mailserver:587/"
set smtp_pass = "$contrasena"

set ssl_force_tls = yes
set move = no
set imap_keepalive = 900
EOF

echo "Configuración creada en ~/.mutt/muttrc"
