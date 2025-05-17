#!/bin/bash

# Directorio a exponer
DIRECTORIO="./backup"
# Puerto en el que se levantará el servidor
PUERTO=8000

# Verifica si el directorio existe
if [ ! -d "$DIRECTORIO" ]; then
    echo "❌ El directorio '$DIRECTORIO' no existe. Créalo o verifica la ruta."
    exit 1
fi

echo "Levantando servidor web en http://localhost:$PUERTO/"
echo "Exponiendo el contenido de: $DIRECTORIO"

# Ejecuta el servidor
python3 -m http.server "$PUERTO" --directory "$DIRECTORIO"
