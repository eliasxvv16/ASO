# Práctica 1: Administración Remota de Sistemas

Esta práctica demuestra la administración remota segura de servidores mediante herramientas web con conexión HTTPS.

## Parte A: Windows Admin Center (WAC)

Se ha instalado **Windows Admin Center** en el equipo Windows 11 y se ha utilizado para gestionar el servidor **Windows Server 2025** a través de HTTPS.

| Sistema administrado     | Herramienta           | Protocolo | Puerto |
|--------------------------|-----------------------|-----------|--------|
| Windows Server 2025      | Windows Admin Center  | HTTPS     | 6516   |

![Acceso a WAC](capturas/wac_acceso.png)

![Servidor Windows administrado desde WAC](capturas/wac_servidor.png)

---

## Parte B: Cockpit en Ubuntu Server

En el servidor **Ubuntu Server 24.04** se ha habilitado el servicio **Cockpit**, se ha creado un usuario no root (`adminremoto`) para acceso remoto, y se ha accedido desde el navegador de Windows 11.

| Sistema          | Usuario remoto | Herramienta | Protocolo | Puerto |
|------------------|----------------|-------------|-----------|--------|
| Ubuntu Server 24.04 | adminremoto    | Cockpit     | HTTPS     | 9090   |

![Estado del servicio Cockpit](capturas/cockpit_servicio.png)

![Usuario remoto creado en Ubuntu](capturas/cockpit_usuario.png)

![Monitorización del sistema desde Cockpit](capturas/cockpit_monitorizacion.png)