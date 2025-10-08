<#
.SYNOPSIS
        Script de ejemplo condicional.
 
 .DESCRIPTION
 
        Condicional "Mayor o menor de edad"
 
 
 .PARAMETER  [Nombre de Parametro]
 
        No hay ningun parametro
 
.EXAMPLE
 
        /edad-usuario.ps1
 
.NOTES
 
        Autor:   Elias Halloumi El Amraoui
        Fecha:   1/10/2025
        Version:  1.0
#>

$edad = Read-Host "Introduce Tú edad"
if ([int]$edad -ge 18) {
    Write-Host "Eres mayor de edad."
} else {
    Write-Host "Eres menor de edad."
}