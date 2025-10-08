# Gestión del Servicio KEA con systemctl

---

## Control del servicio KEA con systemctl
- **Que es `systemctl`?**
  
  Es una herramienta de línea de comandos en sistemas operativos Linux que utiliza systemd para gestionar y controlar los servicios y el sistema en general. Permite a los usuarios iniciar, detener, reiniciar, habilitar y deshabilitar servicios, verificar su estado, y administrar otros aspectos del arranque y funcionamiento del sistema operativo. 
---
- **Comandos principales:**
  - `start kea-dhcp4.service` — Inicia el servicio DHCPv4.
  - `stop kea-dhcp4.service` — Detiene el servicio.
  - `restart kea-dhcp4.service` — Reinicia el servicio para aplicar cambios.
  - `status kea-dhcp4.service` — Consulta el estado actual del servicio.

- **systemd** administra el proceso y garantiza la ejecución continua del daemon KEA.

- **Visualización de logs y errores:**
  - `journalctl -u kea-dhcp4.service` — Muestra los logs generados por el servicio.

---

## Diagrama de gestión:
![](img/eliassdiagram.png)