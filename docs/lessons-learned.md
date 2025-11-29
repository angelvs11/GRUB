### **docs/lessons-learned.md**
```markdown
# Lessons Learned

1. **Importancia de respaldos previos**  
   Crear snapshots de la VM y respaldar archivos críticos permite revertir cambios de manera segura.

2. **Comprensión del flujo de arranque**  
   GRUB2 controla la carga del kernel y opciones de arranque, lo cual es esencial para recuperación de sistemas.

3. **Modificaciones controladas**  
   Los cambios deben realizarse solo en `/etc/default/grub` y luego regenerarse con `update-grub`.

4. **Recuperación práctica**  
   Conocer GRUB Rescue Mode y el uso de un Live USB garantiza que el sistema pueda repararse incluso tras fallos críticos.

5. **Seguridad en configuraciones críticas**  
   Seguir buenas prácticas evita dejar el sistema inestable o inaccesible.
