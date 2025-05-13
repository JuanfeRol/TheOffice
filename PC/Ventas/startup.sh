#!/bin/bash

# Inicia CUPS
cupsd

# Espera a que el socket esté disponible
while [ ! -e /run/cups/cups.sock ]; do
  sleep 1
done

/usr/local/bin/mount_samba.sh
lpadmin -p ImpresoraRed -E -v ipp://Impresora1_Ventas:631/printers/DummyPrinter 
lpadmin -p ImpresoraRed -E -v ipp://Impresora2_Ventas:631/printers/DummyPrinter 

# No salir del contenedor
tail -f /dev/null
