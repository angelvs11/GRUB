# Lab 1.4: GRUB Configuration and Boot Process Analysis

**Student:** Angel Valencia
**Date:** 25/11/2025  
**Course:** Operating Systems  

---

## Objectives Completed
- Analizar la estructura y funcionalidad del bootloader GRUB2.  
- Modificar configuraciones de GRUB de forma segura en una VM.  
- Cambiar el comportamiento del menú de arranque (timeout y estilo).  
- Investigar y documentar procedimientos de recuperación ante fallos.  
- Aplicar buenas prácticas de seguridad (respaldos, snapshots).

---

## Main Changes Implemented

1. **Respaldos y snapshot**
   - Snapshot de la VM: *Before GRUB Lab* (VirtualBox → Machine → Take Snapshot).  
   - Copias de seguridad de archivos críticos:
     ```bash
     sudo cp /etc/default/grub /etc/default/grub.backup
     sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.backup
     ls -la /etc/default/grub*
     ls -la /boot/grub/grub.cfg*
     ```

2. **Modificaciones en `/etc/default/grub`**  
   Se editaron las siguientes líneas (ejemplo completo):
   ```bash
   GRUB_DEFAULT=0
   GRUB_TIMEOUT=30
   GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
   GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
   GRUB_CMDLINE_LINUX=""
   GRUB_TIMEOUT_STYLE=menu
   ```
   > Nota: editar solo `/etc/default/grub`. No editar manualmente `/boot/grub/grub.cfg`.

3. **Aplicación de cambios**
   ```bash
   sudo update-grub
   ```
   - Verificar salida de `update-grub` para asegurarse de que no haya errores.  
   - En caso de error, restaurar backup:
     ```bash
     sudo cp /etc/default/grub.backup /etc/default/grub
     sudo update-grub
     ```

4. **Verificación en arranque**
   - Reiniciar la VM y comprobar:
     - El menú de GRUB aparece y el timeout es de 30 segundos.
     - Número de entradas del menú acorde a lo esperado.
     - El sistema arranca normalmente a la entrada por defecto.

---

## Results Verified
- `GRUB_TIMEOUT` cambiado de **5** a **30** segundos.  
- `GRUB_TIMEOUT_STYLE=menu` fuerza la visualización del menú.  
- `GRUB_DEFAULT=0` arranca la primera entrada por defecto.  
- `update-grub` ejecutado sin errores (salida verificada).  
- El sistema reinició y arrancó correctamente tras los cambios.

---

## Key Learnings
- Siempre crear **snapshots** y **backups** antes de tocar configuraciones críticas.  
- `/etc/default/grub` es el archivo de configuración editable; `grub.cfg` es generado.  
- `GRUB_TIMEOUT` y `GRUB_TIMEOUT_STYLE` controlan la interacción del usuario con el menú.  
- Conocer GRUB Rescue Mode y el procedimiento de chroot desde un Live USB es esencial para recuperación.  
- Mantener procedimientos claros de restauración garantiza poder revertir cambios rápidamente.

---

## Evidence Files
- `pre-lab-analysis.md` — Análisis inicial del estado de GRUB y parámetros observados.  
- `configuration-changes.md` — Registro detallado de las modificaciones aplicadas.  
- `grub-recovery-guide.md` — Guía de recuperación (Rescue Mode, Live USB, chroot, reinstalación).  
- `lessons-learned.md` — Reflexiones y aprendizajes clave.  
- **Screenshots:**  
  - `grub_menu_before.png` — Menú de GRUB antes de los cambios.  
  - `grub_menu_after.png` — Menú de GRUB después de las modificaciones.

---

## Appendix — Comandos útiles (resumen)
```bash
# Ver configuración actual
sudo cat /etc/default/grub
sudo less /boot/grub/grub.cfg

# Comprobar versión de GRUB
grub-install --version

# Respaldos
sudo cp /etc/default/grub /etc/default/grub.backup
sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.backup

# Editar archivo
sudo nano /etc/default/grub

# Regenerar configuración
sudo update-grub

# Restaurar backup (si es necesario)
sudo cp /etc/default/grub.backup /etc/default/grub
sudo update-grub
```

---

## Screenshots (pendientes de adjuntar)
- `grub_menu_before.png` — captura del menú antes de la modificación (timeout = 5s).  
- `grub_menu_after.png` — captura del menú tras la modificación (timeout = 30s).

---
