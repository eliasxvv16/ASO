🖥️ Administración Remota Segura de Sistemas
Asignatura: Administración de Sistemas Operativos
Autor: Elias Halloumi El Amraoui
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
| Equipo administrador | Windows 11 | Cliente de administración remota | 192.168.1.184 |
| Servidor Linux | Ubuntu Server 24.04 | Servidor SSH | 192.168.1.233 |
| Servidor Windows | Windows Server 2025 | Servidor RDP | 192.168.1.30 |

🔒 Todas las conexiones se realizan desde la máquina Windows 11 a través de red privada.

🔐 PARTE 1 – Acceso SSH seguro a Ubuntu Server
✅ Paso 1: Verificación del servicio SSH
Comprobamos que el servicio SSH está instalado y activo en Ubuntu Server:

```bash
sudo systemctl status ssh
```

📸 Evidencia 1 – Servicio SSH activo:
![](/UT4%20Admin%20Remota/img/evid1.png)

✅ Paso 2: Creación de usuario dedicado remoto_ssh
Creamos un usuario exclusivo para acceso SSH (sin privilegios de root):

```bash
sudo useradd -m -s /bin/bash remoto
sudo passwd remoto
```

📸 Evidencia 2 – Usuario creado:
![](/UT4%20Admin%20Remota/img/evid2.png)

✅ Paso 3: Generación de claves en Windows 11 con PuTTYgen

- Abrir PuTTYgen
- Tipo de clave: RSA – 4096 bits
- Establecer passphrase de seguridad
- Guardar clave privada como: C:\Users\elias\.ssh\remoto.ppk
- Copiar clave pública al portapapeles

📸 Evidencia 3 – Claves generadas (permisos 600/700):
![](/UT4%20Admin%20Remota/img/evid3.png)

✅ Paso 4: Configuración de clave pública en Ubuntu

```bash
sudo -u remoto mkdir -p ~/.ssh
sudo -u remoto chmod 700 ~/.ssh
sudo -u remoto touch ~/.ssh/authorized_keys
sudo -u remoto chmod 600 ~/.ssh/authorized_keys
echo "clave_publica_aqui" | sudo -u remoto tee -a ~/.ssh/authorized_keys
```

📸 Evidencia 4 – Estructura de claves en servidor:
![](/UT4%20Admin%20Remota/img/evid4.png)

✅ Paso 5: Prueba inicial de acceso (antes de bloquear contraseñas)
Configuramos PuTTY:

- Host: 192.168.1.20
- Auth → Browse: id_rsa_remoto.ppk
- Login: remoto

📸 Evidencia 5 – Acceso SSH exitoso sin contraseña:


✅ Paso 6: Bloqueo de autenticación por contraseña
Editamos /etc/ssh/sshd_config:

```conf
PasswordAuthentication no
PermitRootLogin no
AllowUsers remoto
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
| Contraseña SSH |  Deshabilitada |
| Root login |  Prohibido |
| Cifrado |  AES-256 |
| Puerto | 22 (estándar) |

