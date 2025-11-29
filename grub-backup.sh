#!/bin/bash
# === Backup de GRUB ===

# Carpeta donde se guardará el backup
BACKUP_DIR="$HOME/grub-backup-$(date +%Y%m%d_%H%M%S)"

# Crear carpeta de backup
mkdir -p "$BACKUP_DIR"

echo "[+] Guardando /etc/default/grub..."
sudo cp -v /etc/default/grub "$BACKUP_DIR/grub.default.bak"

echo "[+] Guardando /boot/grub/grub.cfg..."
sudo cp -v /boot/grub/grub.cfg "$BACKUP_DIR/grub.cfg.bak"

echo "[+] Guardando carpeta completa /boot/grub/ (opcional, tarda más)..."
sudo cp -avr /boot/grub "$BACKUP_DIR/boot-grub-folder/"

echo "[✔] Backup completado en: $BACKUP_DIR"
