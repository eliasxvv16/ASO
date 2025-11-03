<#
.SYNOPSIS
        Script de ejemplo condicional.
 
 .DESCRIPTION
 
        Condicional "Tabla de multiplicar del 5"
 
 
 .PARAMETER  [Nombre de Parametro]
 
        No hay ningun parametro
 
.EXAMPLE
 
        /condicional.ps1
 
.NOTES
 
        Autor:   Elias Halloumi El Amraoui
        Fecha:   01/10/2025
        Version:  1.0
#>

for ($i = 1; $i -le 10; $i++) {
    $resultado = 5 * $i
    Write-Output "5 x $i = $resultado"
}