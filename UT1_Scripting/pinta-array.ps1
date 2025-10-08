<#
.SYNOPSIS
        Script de array.
 
 .DESCRIPTION
 
        Condicional "Array y bucle"
 
 
 .PARAMETER  [Nombre de Parametro]
 
        No hay ningun parametro
 
.EXAMPLE
 
        /array.ps1
 
.NOTES
 
        Autor:   Elias Halloumi El Amraoui
        Fecha:   01/10/2025
        Version:  1.0
#>

$nombres = @("Elias", "ElCajas", "Asier", "Pedro", "Samuel")
foreach ($nombre in $nombres) {
    Write-Host "Hola, $nombre"
}