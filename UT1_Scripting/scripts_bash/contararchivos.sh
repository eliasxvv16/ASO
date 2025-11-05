#!/usr/bin/env bash

# Nombre: saludo.sh
# Descripción: Saluda a la persona pasada como parámetro.
# Autor: Elias Halloumi El Amraoui
# Uso: ./saludo.sh NOMBRE
# Versión: 1.0
# Fecha: 2025-11-03

# Verificar si se proporciona un directorio como argumento
if [ $# -eq 0 ]; then
    dir="."  # Si no se proporciona, usa el directorio actual
else
    dir="$1"  # Usa el directorio proporcionado como argumento
fi

# Verificar si el directorio existe
if [ ! -d "$dir" ]; then
    echo "Error: El directorio $dir no existe"
    exit 1
fi

# Contar archivos en el directorio
num_archivos=$(ls -l "$dir" | grep -c "^-")

# Mostrar resultado
echo "El directorio $dir contiene $num_archivos archivos"

