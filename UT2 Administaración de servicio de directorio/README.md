# 📁 UT2 --- Administración de Servicio de Directorio

#**Asignatura:** Administración de Sistemas Operativos (ASO)
#**Autor:** Elias Halloumi El Amraoui 
#**Entorno:** 
Este repositorio contiene la documentación y los pasos realizados en la
Unidad Temática 2, centrada en la administración de servicios de
directorio mediante **Active Directory**, su integración con clientes
Windows y la interconexión segura con Internet usando **pfSense** como firewall/router.

## 🎯 Objetivos Generales

-   Instalar y configurar un dominio Active Directory (AD) con Windows
    Server 2025.
-   Unir clientes (Windows Server y Windows 11) al dominio.
-   Configurar pfSense como gateway con NAT y reenvío DNS para acceso a
    Internet.
-   Gestionar objetos del dominio: Unidades Organizativas (UOs),
    usuarios, grupos y permisos delegados.
-   Verificar replicación multi-DC y accesos compartidos basados en
    grupos.

## 📚 Actividades

### ✅ Actividad 1 --- Instalación Básica de Dominio

**Objetivo:** Crear un entorno de dominio simple con un único
Controlador de Dominio (DC).

**Máquinas utilizadas:** - WS_GUI_202_DC1 → Controlador de Dominio (AD
DS + DNS) - WS_GUI_202_DC2 → Cliente Windows Server - W11 → Cliente
Windows 11

**Pasos clave:** - Asignación de nombres únicos y verificación de SIDs
tras clonación. - Instalación del rol Active Directory Domain Services
(AD DS). - Promoción del DC como primer servidor en un nuevo bosque
(`ehe.local`). - Exportación del script PowerShell generado.

### 🌐 Actividad 2 --- Conexión WAN con pfSense

**Objetivo:** Proporcionar acceso a Internet a la red privada del
dominio mediante pfSense.

**Topología:** WAN (NAT) → Internet\
LAN (VMnet1 / Host-only) → 192.168.111.0/24

**Configuración:** - pfSense con 2 NICs: WAN (DHCP) y LAN
(192.168.111.1). - DHCP LAN con rango 192.168.111.100--199.

**DNS:** - DC1 usa 127.0.0.1 como DNS primario. - pfSense usa DC como
DNS upstream. - Reenviadores DNS en DC1 → 192.168.111.1.

### 🔁 Actividad 3 --- Segundo Controlador de Dominio

-   Promoción de WS_GUI_202_DC2 como segundo DC.
-   Verificación con repadmin y dcdiag.

### 👥 Actividad 4 --- Gestión de Objetos y Permisos

-   Delegación sobre ASIR2 al usuario ASIR2PR.
-   Carpeta compartida con permisos para AlumnosASIR2.
-   Pruebas desde W11: OK.


## 📎 Archivos Adjuntos

-   ASO_UT2_Actividad1_HalloumiElAmraouiElias.pdf
-   ASO_UT2_Actividad2_HalloumiElAmraouiElias.pdf
-   ASO_UT2_Actividad3_HalloumiElAmraouiElias.pdf
-   ASO_UT2_Actividad4_HalloumiElAmraouiElias.pdf

## 📌 Notas Finales

-   Dominio usado: **ehe.local**.
-   SIDs deben ser únicos.
-   IPs estáticas recomendadas.

© Elias Halloumi El Amraoui --- 2025
