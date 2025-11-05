#!/usr/bin/env bash

# Nombre: Backup_Extension.sh
# Descripción: Realiza una copia de archivos de una extensión específica
# Autor: Elias Halloumi El Amraoui
# Uso: ./Backup_Extension.sh DIRECTORIO_ORIGEN EXTENSION
# Versión: 1.0
# Fecha: 2025-11-05

# Verificar si se proporcionan los argumentos necesarios
if [ $# -ne 2 ]; then
    echo "Error: Debe proporcionar un directorio origen y una extensión"
    echo "Uso: $0 DIRECTORIO_ORIGEN EXTENSION"
    echo "Ejemplo: $0 /home/usuario/documentos txt"
    exit 1
fi

# Guardar los argumentos
dir_origen="$1"
extension="$2"

# Verificar si el directorio origen existe
if [ ! -d "$dir_origen" ]; then
    echo "Error: El directorio origen $dir_origen no existe"
    exit 1
fi

# Obtener el nombre base del directorio
dir_nombre=$(basename "$dir_origen")

# Crear nombre del directorio backup con fecha y extensión
fecha=$(date +%Y%m%d_%H%M%S)
dir_backup="/tmp/${dir_nombre}_${extension}_backup_${fecha}"

# Crear el directorio de backup
mkdir -p "$dir_backup"

# Buscar y copiar archivos con la extensión especificada
if find "$dir_origen" -type f -name "*.$extension" -exec cp {} "$dir_backup" \; ; then
    # Verificar si se copiaron archivos
    num_archivos=$(ls -1 "$dir_backup" | wc -l)
    if [ $num_archivos -eq 0 ]; then
        echo "No se encontraron archivos con extensión .$extension"
        rm -r "$dir_backup"
    else
        echo "Backup creado exitosamente en: $dir_backup"
        echo "Se copiaron $num_archivos archivos con extensión .$extension"
    fi
else
    echo "Error: No se pudo crear el backup"
    rm -r "$dir_backup"
    exit 1
fi