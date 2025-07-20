
# 🚀 Configuración automática de VPS para IB Gateway (Ubuntu 22.04)

Este proyecto tiene como objetivo automatizar la configuración inicial de un **VPS en Contabo con Ubuntu 22.04**, instalar **IB Gateway**, entorno gráfico, y herramientas de trading con Python.

```https://contabo.com/es/vps/cloud-vps-10/?addons=1987&image=ubuntu.332&qty=1&contract=1&storage-type=cloud-vps-10-150-gb-ssd```
---

## 🔧 1. Subir el archivo `install.sh` al VPS

Desde tu PC (Windows), usa este comando para copiar el script al servidor:

```bash
scp install.sh root@IP_DEL_VPS:/root/
```

Ejemplo:

```bash
scp install.sh root@ipvps:/root/
```

---

## 🚀 2. Conectarse al VPS por SSH y ejecutar el script

Conéctate:

```bash
ssh root@207.180.232.55
```

Dale permisos de ejecución y lánzalo:

```bash
chmod +x install.sh
./install.sh
```

Este script instalará:
- Entorno gráfico XFCE
- Acceso por Escritorio Remoto (xrdp)
- Dependencias de Python y librerías de trading
- IB Gateway en modo standalone

---

## 🖥️ 3. Conectarse por Escritorio Remoto (RDP)

Usa **Escritorio Remoto de Windows** (mstsc) o cualquier cliente RDP:

- Dirección: `ip vps`
- Usuario: `root`
- Escritorio: XFCE

---

## 💡 4. Si IB Gateway no aparece tras iniciar sesión

A veces el lanzador de IB Gateway no aparece por defecto. Puedes lanzarlo manualmente:

1. En el escritorio remoto, abre:
   ```
   Applications > Run Program
   ```
2. Escribe el comando:

   ```bash
   /opt/IB/IBGateway/xxxx/ibgateway.sh
   ```

   > ⚠️ Reemplaza `xxxx` con el número de versión (usa `ls /opt/IB/IBGateway/` para verlo)

3. Una vez abierto:
   - Configura el **puerto 4001** (si usarás IB Gateway)
   - Desmarca **Read-Only API** si quieres que los scripts ejecuten órdenes
   - Asegúrate de habilitar el acceso por socket

---

## 🧪 5. Probar conexión con `ib_insync`

Primero, copia el archivo de prueba al VPS:

```bash
scp test_connect.py root@ipvps:/root/
```

Luego, conéctate por RDP, abre una **terminal** en el escritorio remoto y ejecuta:

```bash
python3 test_connect.py
```

> ⚠️ Verifica que el puerto en el script coincida con el configurado en IB Gateway (normalmente `7497`).

---

## 📦 6. Copiar tu proyecto completo al VPS

Puedes usar `scp` para subir un directorio completo:

```bash
scp -r /ruta/al/proyecto root@ipvps:/root/
```

Ejemplo:

```bash
scp -r C:\Users\TuUsuario\Desktop\mi_proyecto root@ipvps:/root/
```

---

## 💡 Alternativa recomendada: usar VS Code + SSH

1. Instala la extensión **Remote - SSH** en Visual Studio Code.
2. Agrega tu VPS a `~/.ssh/config` o conéctalo desde la paleta de comandos (`F1` > “Remote-SSH: Connect to Host...”).
3. Edita y gestiona archivos del servidor **como si fueran locales**, con autocompletado y terminal integrada.

---

## ✅ Resultado

Con esto tendrás:

- Un VPS con escritorio gráfico
- IB Gateway operativo
- Python y librerías listas para trading
- Conexión probada desde `ib_insync`

---

### 🧠 Consejo

Una vez todo esté funcionando, puedes crear un servicio para que IB Gateway se inicie automáticamente. Si necesitas ayuda con eso, abre un issue o consulta la wiki del proyecto.
