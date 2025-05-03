#!/bin/bash

# Inicia CUPS en background
cupsd

# Espera a que CUPS responda (puerto IPP 631)
until curl -sSf http://localhost:631 >/dev/null 2>&1; do
  echo "Esperando que CUPS este listo..."
  sleep 1
done

# Crear impresora dummy
lpadmin -p DummyPrinter -E -v file:/dev/null -m drv:///sample.drv/generic.ppd
cupsenable DummyPrinter
cupsaccept DummyPrinter
lpadmin -p DummyPrinter -o printer-is-shared=true

# No salir del contenedor
tail -f /dev/null
