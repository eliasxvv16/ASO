do {
    Write-Host "Menú:"
    Write-Host "1 - Mostrar la fecha actual"
    Write-Host "2 - Mostrar el usuario actual"
    Write-Host "3 - Salir"
    $opcion = Read-Host "Seleccione una opción (1-3)"

    switch ($opcion) {
        '1' {
            Write-Host "Fecha actual: $(Get-Date)"
        }
        '2' {
            Write-Host "Usuario actual: $env:USERNAME"
        }
        '3' {
            Write-Host "Saliendo..."
        }
        Default {
            Write-Host "Opción no válida."
        }
    }
} while ($opcion -ne '3')