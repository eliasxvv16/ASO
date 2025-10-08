<#
.SYNOPSIS
        Script de ejemplo condicional.
 
 .DESCRIPTION
 
        Condicional "Mostrar el cuadrado de los números del 1 al 10"
 
 
 .PARAMETER  [Nombre de Parametro]
 
        No hay ningun parametro
 
.EXAMPLE
 
        /calcula-cuadrado.ps1
 
.NOTES
 
        Autor:   Elias Halloumi El Amraoui
        Fecha:   1/10/2025
        Version:  1.0
#>    

$numeros = 1..10

foreach ($n in $numeros) {
    Write-Output "$n^2 = $($n * $n)"
}