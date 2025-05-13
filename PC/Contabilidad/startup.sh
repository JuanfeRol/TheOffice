#!/bin/bash

# Inicia CUPS
cupsd

# Espera a que el socket esté disponible
while [ ! -e /run/cups/cups.sock ]; do
  sleep 1
done

lpadmin -p ImpresoraRed -E -v ipp://Impresora1_Contabilidad:631/printers/DummyPrinter 
lpadmin -p ImpresoraRed -E -v ipp://Impresora2_Contabilidad:631/printers/DummyPrinter 

# No salir del contenedor
tail -f /dev/null
