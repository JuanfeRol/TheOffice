#!/bin/bash

# Inicia CUPS
cupsd

# Espera a que el socket esté disponible
while [ ! -e /run/cups/cups.sock ]; do
  sleep 1
done

# Crear impresora dummy
lpadmin -p DummyPrinter -E -v file:/dev/null -m drv:///sample.drv/generic.ppd
cupsenable DummyPrinter
cupsaccept DummyPrinter

# No salir del contenedor
tail -f /dev/null
