#!/bin/bash

# Inicia CUPS
cupsd

# Espera a que el socket esté disponible
while [ ! -e /run/cups/cups.sock ]; do
  sleep 1
done



# No salir del contenedor
tail -f /dev/null
