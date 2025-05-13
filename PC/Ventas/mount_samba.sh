#!/bin/bash

# Esperar a que el servidor Samba esté disponible
echo "Esperando al servidor Samba..."
until ping -c 1 samba_server &> /dev/null; do
  sleep 1
done
echo "Servidor Samba disponible."

# Crear punto de montaje si no existe
mkdir -p /mnt/samba_shared

# Montar recurso compartido
mount -t cifs //samba_server/shared /mnt/samba_shared \
  -o username=smbuser,password=smbpass,vers=1.0

# Verificar si se montó correctamente
if mount | grep "/mnt/samba_shared" > /dev/null; then
  echo "Recurso Samba montado correctamente en /mnt/samba_shared."
else
  echo "Error al montar el recurso Samba."
fi
