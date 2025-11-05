#!/usr/bin/env bash

# Nombre: Backup_Directorio.sh
# Descripción: Realiza una copia de respaldo de un directorio y su contenido
# Autor: Elias Halloumi El Amraoui
# Uso: ./Backup_Directorio.sh DIRECTORIO_ORIGEN
# Versión: 1.0
# Fecha: 2025-11-05

# Verificar si se proporciona un directorio como argumento
if [ $# -eq 0 ]; then
    echo "Error: Debe proporcionar un directorio origen"
    echo "Uso: $0 DIRECTORIO_ORIGEN"
    exit 1
fi

# Guardar el directorio origen
dir_origen="$1"

# Verificar si el directorio origen existe
if [ ! -d "$dir_origen" ]; then
    echo "Error: El directorio origen $dir_origen no existe"
    exit 1
fi

# Obtener el nombre base del directorio
dir_nombre=$(basename "$dir_origen")

# Crear nombre del directorio backup con fecha
fecha=$(date +%Y%m%d_%H%M%S)
dir_backup="/tmp/${dir_nombre}_backup_${fecha}"

# Crear el backup
if cp -r "$dir_origen" "$dir_backup"; then
    echo "Backup creado exitosamente en: $dir_backup"
else
    echo "Error: No se pudo crear el backup"
    exit 1
fi