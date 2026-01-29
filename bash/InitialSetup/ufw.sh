#!/bin/bash
# Chặn tất cả chiều vào, mở tất cả chiều ra
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp  # cho phép ssh
sudo ufw allow in on wt0 # cho phép giao diện mạng của netbird
sudo ufw allow 54782 # cho phép port của qbittorrent
