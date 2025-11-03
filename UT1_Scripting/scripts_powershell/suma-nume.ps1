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

$suma = 0
for ($i = 1; $i -le 100; $i++) {
    $suma += $i
}
Write-Output "La suma de los numeros del 1 al 100 es: $suma"
