<#
.SYNOPSIS
        Script de ejemplo condicional.
 
 .DESCRIPTION
 
        Condicional "par o impar"
 
 
 .PARAMETER  [Nombre de Parametro]
 
        No hay ningun parametro
 
.EXAMPLE
 
        /condicional.ps1
 
.NOTES
 
        Autor:   Elias Halloumi El Amraoui
        Fecha:   01/10/2025
        Version:  1.0
#>

$numero = Read-Host "Introduce un número"

if ([int]$numero % 2 -eq 0) {
    Write-Host "El número $numero es par."
} else {
    Write-Host "El número $numero es impar."
}
