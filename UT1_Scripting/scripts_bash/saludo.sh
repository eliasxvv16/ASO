#!/usr/bin/env bash

# Nombre: saludo.sh
# Descripción: Saluda a la persona pasada como parámetro.
# Autor: Elias Halloumi El Amraoui
# Uso: ./saludo.sh NOMBRE
# Versión: 1.0
# Fecha: 2025-11-03


if [[ "${#}" -eq 0 ]]; then
    echo "Proporcione al menos un nombre." >&2
    exit 1
fi

# Junta todos los parámetros para permitir nombres con espacios
NOMBRE="$*"

echo "Hola, ${NOMBRE}!"
