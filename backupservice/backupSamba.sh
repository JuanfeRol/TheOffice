#!/bin/bash

SAMBA_SERVER="sambaserver"
SAMBA_SHARE="shared"
MOUNT_POINT="/mnt/sambabackup"
BACKUP_DIR="/backup"
CRED_FILE="/root/.smbcredentials"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="samba_backup_$DATE.tar.gz"

mkdir -p /mnt/sambabackup


# Montar recurso si no está montado VERSION 3
if ! mountpoint -q "$MOUNT_POINT"; then
  mount -t cifs //${SAMBA_SERVER}/${SAMBA_SHARE} $MOUNT_POINT \
    -o credentials=$CRED_FILE,vers=3.0,iocharset=utf8
fi

if mountpoint -q "$MOUNT_POINT"; then
  tar -czf $BACKUP_DIR/$BACKUP_NAME -C $MOUNT_POINT .
  echo "[+] Backup creado: $BACKUP_DIR/$BACKUP_NAME"
  umount $MOUNT_POINT
else
  echo "[!] Error al montar el recurso Samba."
fi
