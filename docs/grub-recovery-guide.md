### docs/grub-recovery-guide.md
```markdown
# GRUB Recovery Guide

## GRUB Rescue Mode
- **Acceso:** ocurre automáticamente si GRUB no encuentra `grub.cfg`
- **Comandos básicos:** `ls`, `set`, `insmod`
- **Arranque manual:** localizar kernel y ejecutar `linux` + `initrd` + `boot`

## Recovery desde Live USB/DVD
1. Iniciar desde medio externo
2. Montar partición raíz:
   ```bash
   sudo mount /dev/sdXn /mnt
