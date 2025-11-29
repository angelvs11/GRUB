### **docs/configuration-changes.md**
```markdown
# Configuration Changes

## Objetivo
Modificar la configuración de GRUB para personalizar el tiempo de espera y parámetros de arranque, asegurando que el sistema continúe funcionando correctamente.

## Cambios realizados en `/etc/default/grub`
```bash
GRUB_DEFAULT=0
GRUB_TIMEOUT=30
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
GRUB_TIMEOUT_STYLE=menu
