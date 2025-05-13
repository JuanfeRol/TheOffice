#!/bin/bash
read -p "Correo: " MAIL_USER
read -sp "Contraseña: " MAIL_PASS
echo
HASH=$(doveadm pw -s SHA512-CRYPT -u "$MAIL_USER" -p "$MAIL_PASS")
echo "$MAIL_USER|$HASH" >> /mail-config/postfix-accounts.cf
echo "Usuario agregado exitosamente."
