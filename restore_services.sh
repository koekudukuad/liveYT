#!/bin/bash

# Ekstrak file backup
mkdir -p /root/backup
tar xzvf /root/service_backup.tar.gz -C /root/backup

# Copy .service ke systemd
cp /root/backup/services/*.service /etc/systemd/system/

# Copy video ke root
cp /root/backup/videos/*.mp4 /root/

# Reload systemd
systemctl daemon-reexec
systemctl daemon-reload

# Aktifkan semua service hasil restore
for service in /root/backup/services/*.service; do
    name=$(basename "$service")
    systemctl enable "$name"
    systemctl start "$name"
    echo "✅ Service $name telah diaktifkan dan dijalankan."
done

echo "🎉 Restore selesai."
