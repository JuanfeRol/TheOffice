#!/bin/bash

echo "Configurador de cuenta de correo para Mutt"

read -p "Correo (ej: juan@docker.local): " correo
read -sp "Contraseña: " contrasena
echo
read -p "Nombre completo: " nombre

# Crear carpeta si no existe
mkdir -p ~/.mutt/cache/headers
mkdir -p ~/.mutt/cache/bodies
touch ~/.mutt/certificates

# Extraer el usuario del correo
usuario=${correo%@*}

# Generar el archivo de configuración
cat > ~/.mutt/muttrc <<EOF
set imap_user = "$correo"
set imap_pass = "$contrasena"
set from = "$correo"
set realname = "$nombre"

set folder = "imap://mailserver"
set spoolfile = "+INBOX"

# Envío de correos con TLS implícito en puerto 465
set smtp_url = "smtps://$usuario@mailserver:465/"
set smtp_pass = "$contrasena"
set ssl_force_tls = yes
set ssl_verify_host = no

# Otros ajustes recomendados
set move = no
set imap_keepalive = 900
set certificate_file = "~/.mutt/certificates"
EOF

echo "Configuración creada correctamente en ~/.mutt/muttrc"
