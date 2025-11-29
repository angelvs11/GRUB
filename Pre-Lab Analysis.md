# Pre-Lab Analysis

## Objetivo
Analizar la configuración actual de GRUB2 antes de realizar modificaciones, identificando parámetros clave y el comportamiento del menú de arranque.

## Archivos de respaldo
Antes de iniciar, se crearon respaldos:
- `/etc/default/grub.backup`
- `/boot/grub/grub.cfg.backup`

Verificación:
```bash
ls -la /etc/default/grub*
ls -la /boot/grub/grub.cfg*