#!/bin/bash

# Buat folder backup
mkdir -p /root/backup/services
mkdir -p /root/backup/videos

# Backup semua .service buatan sendiri
cp /etc/systemd/system/*.service /root/backup/services/

# Backup semua file .mp4 dari /root
cp /root/*.mp4 /root/backup/videos/

# Kompres semua jadi 1 file
tar czvf /root/service_backup.tar.gz -C /root/backup .

echo "✅ Backup selesai. File: /root/service_backup.tar.gz"
