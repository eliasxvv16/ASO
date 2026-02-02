# 🖥️ Administración Remota de Sistemas en Red  
**Asignatura:** Administración de Sistemas Operativos   
**Autor** Elias Halloumi El Amraoui  
**Unidad:** UT4 – Administración Remota  
**Curso:** 2025/2026  

---

## 🎯 Objetivo de la práctica

Comprobar que es posible administrar y monitorizar remotamente sistemas
operativos en red mediante herramientas web, utilizando usuarios
específicos y conexiones cifradas HTTPS.

La práctica se divide en dos partes:

- Parte A: Administración remota de Windows Server con Windows Admin Center
- Parte B: Administración remota de Ubuntu Server con Cockpit

---

## 🏗️ Infraestructura utilizada

| Equipo             | Sistema Operativo      | Rol                         |
|--------------------|------------------------|-----------------------------|
| Equipo administrador | Windows 11            | Cliente web de administración |
| Servidor Windows   | Windows Server 2025    | Servidor administrado (WAC) |
| Servidor Linux     | Ubuntu Server 24.04    | Servidor administrado (Cockpit) |

Todas las conexiones se realizan desde el navegador del Windows 11.

---

## 🪟 PARTE 1 – Windows Admin Center (WAC)

### Acceso a Windows Admin Center

Desde el navegador del Windows 11 accedemos a:
https://localhost:PUERTO


iniciamos sesión con un usuario válido del sistema  (local/dominio).

📸 Evidencia:  
![](/UT4%20Admin%20Remota/img/cap1.png)

---

### Administración remota del Windows Server

Desde la consola de WAC agregamos el Windows Server 2025 y compruebamos que es posible:

- Ver información del sistema
- Monitorizar CPU y memoria
- Acceder a servicios y eventos

📸 Evidenciaa:  
![](/UT4%20Admin%20Remota/img/cap2.png)
![](/UT4%20Admin%20Remota/img/cap3.png)

---

### Documentación técnica WAC

| Sistema administrado | Herramienta | Protocolo | Puerto |
|----------------------|-------------|-----------|--------|
| Windows Server 2025  | WAC         | HTTP     | 6516   |

---

## 🐧 PARTE 2 – Cockpit (Ubuntu Server)

### Comprobación del servicio Cockpit

En el servidor Ubuntu verificamos que el servicio está activo.

📸 Evidencia:  
![](/UT4%20Admin%20Remota/img/cap4.png)

---

### Creación de usuario remoto

creamos un usuario específico no root para la administración remota mediante Cockpit.

📸 Evidencia:  
![](/UT4%20Admin%20Remota/img/cap5.png)

---

### Acceso remoto desde Windows 11

Desde el navegador del Windows 11 accedemos a:
https://IP_DEL_UBUNTU:9090

Comprobamos la monitorización del sistema (CPU y memoria).

📸 Evidencia:  
![](/UT4%20Admin%20Remota/img/cap6.png)
![](/UT4%20Admin%20Remota/img/cap7.png)

---

### Documentación técnica Cockpit

| Sistema        | Usuario remoto | Herramienta | Protocolo | Puerto |
|----------------|----------------|-------------|-----------|--------|
| Ubuntu Server  |    cockpit     | Cockpit     | HTTPS     | 9090   |

---

## ✅ Conclusión

Se ha verificado que es posible administrar de forma remota sistemas Windows y Linux
mediante interfaces web, utilizando usuarios específicos y protocolos cifrados,
cumpliendo los objetivos planteados en la práctica.
