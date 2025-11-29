#!/bin/bash
# === Restaurar configuración de GRUB desde backup ===

BACKUP_FILE="/etc/default/grub.bak"

if [ ! -f "$BACKUP_FILE" ]; then
    echo "[!] No existe backup en $BACKUP_FILE"
    exit 1
fi

echo "[+] Restaurando /etc/default/grub..."
sudo cp $BACKUP_FILE /etc/default/grub

echo "[+] Regenerando grub.cfg..."
sudo update-grub

echo "[+] Verificando grub.cfg..."
if [ -f /boot/grub/grub.cfg ]; then
    echo "[✔] grub.cfg existe"
    grep menuentry /boot/grub/grub.cfg | head
else
    echo "[!] grub.cfg no encontrado"
fi

# Si es UEFI, mostrar entradas de firmware
if command -v efibootmgr &>/dev/null; then
    echo "[+] Mostrando entradas EFI:"
    sudo efibootmgr -v
fi

echo "[✔] Restauración completada."
