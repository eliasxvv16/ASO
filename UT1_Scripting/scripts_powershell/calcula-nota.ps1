<#
.SYNOPSIS
        Script de.
 
 .DESCRIPTION
 
        Condicional "Calcular la nota cualitativa a partir de una nota numérica"
 
 
 .PARAMETER  [Nombre de Parametro]
 
        No hay ningun parametro
 
.EXAMPLE
 
        /calcula-nota.ps1
 
.NOTES
 
        Autor:   Elias Halloumi El Amraoui
        Fecha:   01/10/2025
        Version:  1.0
#>

$valor = Read-Host "Introduce una nota numérica (0-10)"

if ([double]::TryParse($nota, [ref]$valor)) {
    if ($valor -ge 9 -and $valor -le 10) {
        Write-Output "Sobresaliente"
    } elseif ($valor -ge 7 -and $valor -le 8) {
        Write-Output "Notable"
    } elseif ($valor -ge 5 -and $valor -le 6) {
        Write-Output "Aprobado"
    } elseif ($valor -ge 0 -and $valor -le 4) {
        Write-Output "Suspenso"
    } else {
        Write-Output "La nota debe estar entre 0 y 10."
    }
} else {
    Write-Output "Entrada no válida. Introduce un número."
}