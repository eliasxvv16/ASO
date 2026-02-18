# 🛠️ RA5 – Automatización en Windows Server con GPO

Práctica de la UT5 donde se trabajan automatizaciones reales en entorno Windows utilizando **Directivas de Grupo (GPO)**.  
El objetivo es simular tareas típicas de un administrador de sistemas en una empresa.

---

# 📌 Contexto de la práctica

En esta actividad se nos pide implementar dos automatizaciones dentro de un dominio Windows:

1. 🔐 **Asignación automática de unidades de red según departamento**
2. 🧹 **Sistema de mantenimiento automático mediante script PowerShell**

Todo debe funcionar sin intervención manual del usuario.

---

# 🖥️ Entorno de trabajo

- Windows Server 2025 (Controlador de Dominio)
- Windows 11 (cliente unido al dominio)
- Red privada interna
- Dominio: `ehe.local`

---

# 🌲 Estructura de Active Directory

Se ha creado la siguiente organización en el dominio:

```
ehe.local
├── UO_Administracion
├── UO_Informatica
├── UO_Usuarios
├── UO_Equipos_Politica
└── UO_Equipos_Control
```

### 👥 Usuarios creados

- Administración: `user_admin1`, `user_admin2`
- Informática: `user_info1`, `user_info2`
- Usuarios generales: `user_user1`, `user_user2`

### 🔐 Grupos de seguridad

- `GRP_Administracion`
- `GRP_Informatica`

Cada grupo contiene únicamente a los usuarios de su departamento.

---

# 🗂️ TAREA 1 — Mapeo automático de unidades de red

## 🎯 Objetivo

Configurar el sistema para que cada usuario vea automáticamente sus unidades de red al iniciar sesión, dependiendo del grupo al que pertenezca.

Además:
- Debe existir un recurso común para todos.
- Los permisos deben impedir accesos no autorizados.

---

## 📁 Creación de carpetas en el servidor

Ruta utilizada:

```
C:\Compartidas\
├── Admin
├── Informatica
└── Comun
```

### 📌 Recursos compartidos configurados

| Carpeta | Nombre compartido | Acceso permitido |
|----------|------------------|------------------|
| Admin | Compartida-Admin | GRP_Administracion |
| Informatica | Compartida-Info | GRP_Informatica |
| Comun | Compartida-Todos | Todos los usuarios |

⚠️ Se eliminó el grupo "Todos" de permisos y se añadieron únicamente los grupos necesarios para reforzar la seguridad.

---

## 🧩 Creación de la GPO de mapeo

Nombre de la GPO:

```
Mapeo-Unidades-ehe
```

Ruta en GPMC:

```
Configuración de usuario
 └── Preferencias
      └── Configuración de Windows
           └── Asignaciones de unidad
```

### 🔠 Unidades configuradas

- **Z:** → `\\DC\Admin`
  - Segmentación → Usuario miembro de `GRP_Administracion`

- **Y:** → `\\DC\Informatica`
  - Segmentación → Usuario miembro de `GRP_Informatica`

- **X:** → `\\DC\Comun`
  - Aplicable a todos

La GPO se vinculó a:

- UO_Administracion  
- UO_Informatica  
- UO_Usuarios  

---

## ✅ Comprobaciones realizadas

| Usuario | Debe ver | No debe ver |
|----------|----------|-------------|
| user_admin1 | Z:, X: | Y: |
| user_info1 | Y:, X: | Z: |

También se comprobó acceso directo por ruta UNC:

```
\\DC\Admin
```

Resultado esperado para usuario no autorizado: **Acceso denegado**

---

## 📸 Evidencias — Tarea 1

### 1️⃣ Estructura de carpetas en el servidor
![](/UT5_Automatización/img/im1.png) 


### 2️⃣ Permisos de recurso compartido y NTFS 
# Carpeta Admin
![](/UT5_Automatización/img/im2.png)
# Carpeta Informatica
![](/UT5_Automatización/img/im3.png)
# Carpeta Comun
![](/UT5_Automatización/img/im4.png)

### 3️⃣ GPO creada y vinculada en GPMC
![](/UT5_Automatización/img/im5.png) 
`/images/t1_gpo_creada.png`

### 4️⃣ Configuración de las unidades dentro de la GPO
![](/UT5_Automatización/img/im6.png)
![](/UT5_Automatización/img/im8.png)
![](/UT5_Automatización/img/im10.png)


### 5️⃣ Segmentación configurada (Item-level targeting)

![](/UT5_Automatización/img/im7.png) 
![](/UT5_Automatización/img/im9.png)

Despues de esto vinculamos la GPO a:
UO_Administracion
UO_Informatica
UO_Usuarios

![](/UT5_Automatización/img/im11.png)

### 6️⃣ Explorador de user_admin1
![](/UT5_Automatización/img/im12.png) 


### 7️⃣ Explorador de user_info1
![](/UT5_Automatización/img/im13.png) 


### 8️⃣ Intento de acceso no autorizado (Acceso denegado)
como usuario user_info vamos a intentar entrar a la carpeta admin
![](/UT5_Automatización/img/im14.png) 


---

# 🧹 TAREA 2 — Mantenimiento automático con PowerShell

## 🎯 Objetivo

Implementar una política que:

- Limpie archivos temporales automáticamente
- Se ejecute semanalmente
- Genere un archivo log por cada ejecución
- Se despliegue sin intervención manual

---

## 📜 Script utilizado

Archivo: `Limpieza_Sistema.ps1`

Ubicación en el dominio:

```
\\ehe.local\SYSVOL\ehe.local\scripts\
```

---

## ⚙️ Creación de la GPO de mantenimiento

Nombre de la política:

```
Mantenimiento-Automatico-ehe
```

Ruta en GPMC:

```
Configuración del equipo
 └── Preferencias
      └── Configuración del Panel de Control
           └── Tareas programadas
```

---

## 🗓️ Configuración de la tarea programada

- Tipo: Tarea programada (no script de inicio)
- Frecuencia: Semanal
- Cuenta de ejecución: `SYSTEM`
- Ejecutar con privilegios más altos ✔
- Programa: `powershell.exe`
- Argumentos:

```
-ExecutionPolicy Bypass -File "\\ehe.local\\SYSVOL\\ehe.local\\scripts\\Limpieza_Sistema.ps1"
```

La GPO fue vinculada a:

```
UO_Usuarios
```

---

## 🔎 Verificación en cliente

En el equipo cliente se realizó:

1. `gpupdate /force`
2. Apertura de `taskschd.msc`
3. Comprobación de la tarea creada
4. Ejecución manual
5. Verificación del log en:

```
C:\Logs
```

---

## 📸 Evidencias — Tarea 2

### 1️⃣ GPO creada y vinculada
![](/UT5_Automatización/img/im15.png) 


### 2️⃣ Configuración completa de la tarea

![](/UT5_Automatización/img/im16.png) 
![](/UT5_Automatización/img/im17.png) 
![](/UT5_Automatización/img/im18.png) 


### 3️⃣ Tarea visible en el cliente (Task Scheduler)
![](/UT5_Automatización/img/im19.png) 


### 4️⃣ Ejecución correcta (Historial o estado correcto)
![](/UT5_Automatización/img/im20.png) 


### 5️⃣ Archivo log generado en C:\Logs
![](/UT5_Automatización/img/im21.png) 


---

# 🧠 Conclusión

Con esta práctica se ha implementado:

- Automatización basada en pertenencia a grupos
- Aplicación de seguridad real mediante permisos NTFS + compartición
- Despliegue centralizado de mantenimiento mediante GPO
- Programación de tareas sin intervención del usuario

Se demuestra cómo las Políticas de Grupo permiten administrar múltiples equipos de forma centralizada y eficiente en entornos empresariales.