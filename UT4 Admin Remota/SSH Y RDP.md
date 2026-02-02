🖥️ Administración Remota Segura de Sistemas
Asignatura: Administración de Sistemas Operativos
Autor: Juan García López
Unidad: UT4 – Administración Remota
Curso: 2025/2026

🎯 Objetivo de la práctica
Configurar y utilizar mecanismos reales de acceso y administración remota entre sistemas Windows y Linux, aplicando criterios de seguridad profesional: usuarios dedicados, cifrado de comunicaciones, autenticación robusta y documentación técnica adecuada.
La práctica se divide en dos partes:

- Parte 1: Acceso remoto seguro por SSH a Ubuntu Server con autenticación por clave pública
- Parte 2: Administración remota gráfica mediante RDP a Windows Server con usuarios restringidos y NLA

🏗️ Infraestructura utilizada

| Equipo | Sistema Operativo | Rol | IP (ejemplo) |
|--------|-------------------|-----|--------------|
| Equipo administrador | Windows 11 | Cliente de administración remota | 192.168.1.10 |
| Servidor Linux | Ubuntu Server 24.04 | Servidor SSH | 192.168.1.20 |
| Servidor Windows | Windows Server 2025 | Servidor RDP | 192.168.1.30 |

🔒 Todas las conexiones se realizan desde la máquina Windows 11 a través de red privada.

🔐 PARTE 1 – Acceso SSH seguro a Ubuntu Server
✅ Paso 1: Verificación del servicio SSH
Comprobamos que el servicio SSH está instalado y activo en Ubuntu Server:

```bash
sudo systemctl status ssh
```

📸 Evidencia 1 – Servicio SSH activo:

✅ Paso 2: Creación de usuario dedicado remoto_ssh
Creamos un usuario exclusivo para acceso SSH (sin privilegios de root):

```bash
sudo useradd -m -s /bin/bash remoto_ssh
sudo passwd remoto_ssh
```

📸 Evidencia 2 – Usuario creado:

✅ Paso 3: Generación de claves en Windows 11 con PuTTYgen

- Abrir PuTTYgen
- Tipo de clave: RSA – 4096 bits
- Generar clave moviendo el ratón
- Establecer passphrase de seguridad
- Guardar clave privada como: C:\Users\<usuario>\.ssh\id_rsa_remoto_ssh.ppk
- Copiar clave pública al portapapeles

📸 Evidencia 3 – Claves generadas (permisos 600/700):

✅ Paso 4: Configuración de clave pública en Ubuntu

```bash
sudo -u remoto_ssh mkdir -p ~/.ssh
sudo -u remoto_ssh chmod 700 ~/.ssh
sudo -u remoto_ssh touch ~/.ssh/authorized_keys
sudo -u remoto_ssh chmod 600 ~/.ssh/authorized_keys
echo "clave_publica_aqui" | sudo -u remoto_ssh tee -a ~/.ssh/authorized_keys
```

📸 Evidencia 4 – Estructura de claves en servidor:

✅ Paso 5: Prueba inicial de acceso (antes de bloquear contraseñas)
Configuramos PuTTY:

- Host: 192.168.1.20
- Auth → Browse: id_rsa_remoto_ssh.ppk
- Login: remoto_ssh

📸 Evidencia 5 – Acceso SSH exitoso sin contraseña:

✅ Paso 6: Bloqueo de autenticación por contraseña
Editamos /etc/ssh/sshd_config:

```conf
PasswordAuthentication no
PermitRootLogin no
AllowUsers remoto_ssh
```

Reiniciamos el servicio:

```bash
sudo systemctl restart ssh
```

📸 Evidencia 6 – Configuración SSH segura:

✅ Paso 7: Verificación de restricción de acceso
Intentamos acceder con otro usuario (ej: juan) → acceso denegado.

📸 Evidencia 7 – Acceso denegado a usuario no autorizado:

📋 Documentación técnica SSH

| Parámetro | Valor |
|-----------|-------|
| Usuario autorizado | remoto_ssh |
| Cliente | PuTTY (Windows 11) |
| Autenticación | Clave pública RSA 4096 |
| Contraseña SSH | ❌ Deshabilitada |
| Root login | ❌ Prohibido |
| Cifrado | ✅ AES-256 |
| Puerto | 22 (estándar) |

💻 PARTE 2 – Administración remota gráfica por RDP
✅ Paso 1: Habilitar Escritorio Remoto en Windows Server 2025

- Win + R → sysdm.cpl
- Pestaña Remoto
- ✅ Permitir conexiones remotas a este equipo
- ✅ Permitir conexiones solo desde equipos con NLA

📸 Evidencia 8 – Escritorio remoto habilitado:

✅ Paso 2: Creación de usuario dedicado remoto_rdp

- Win + R → lusrmgr.msc
- Usuarios → Nuevo usuario: remoto_rdp
- Propiedades → Miembro de → Agregar → Usuarios de Escritorio remoto

📸 Evidencia 9 – Usuario en grupo de RDP:

✅ Paso 3: Habilitar Autenticación de Nivel de Red (NLA)

```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'SecurityLayer' -Value 2
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'UserAuthentication' -Value 1
```

📸 Evidencia 10 – NLA habilitada:

✅ Paso 4: Conexión RDP desde Windows 11

- Abrir mstsc (Conexión a Escritorio remoto)
- Equipo: 192.168.1.30
- Credenciales: remoto_rdp + contraseña
- ✅ Sesión gráfica activa

📸 Evidencia 11 – Sesión RDP activa con remoto_rdp:

✅ Paso 5: Verificación de restricción de acceso
Intentamos conectar con otro usuario sin permisos → acceso denegado.

📸 Evidencia 12 – Acceso RDP denegado a usuario no autorizado:

📋 Documentación técnica RDP

| Parámetro | Valor |
|-----------|-------|
| Usuario autorizado | remoto_rdp |
| Sistema administrado | Windows Server 2025 |
| Protocolo | RDP (Remote Desktop Protocol) |
| Cifrado | ✅ TLS 1.2 + NLA |
| Grupo de acceso | Usuarios de Escritorio remoto |
| Puerto | 3389 (estándar) |
| Autenticación | Nivel de red (NLA) obligatoria |

📁 Estructura del repositorio GitHub

```
UT4 Admin Remota/
├── SSH Y RDP.md
├── WAC Y Cockpit.md
├── img/
│   ├── evidencia1.png
│   ├── evidencia2.png
│   ├── ...
│   └── evidencia12.png
└── README.md
```

✅ Conclusión
Se ha configurado exitosamente un entorno de administración remota seguro que cumple con los estándares profesionales:

- 🔒 SSH en Linux: Acceso exclusivo mediante clave pública RSA 4096, sin autenticación por contraseña, usuario dedicado y root login prohibido.
- 🔐 RDP en Windows: Acceso restringido a usuario específico del grupo autorizado, con cifrado TLS y Autenticación de Nivel de Red obligatoria.
- 📄 Documentación completa: Todas las configuraciones, evidencias y parámetros técnicos registrados para auditoría.