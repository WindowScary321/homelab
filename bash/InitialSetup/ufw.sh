#!/bin/bash
# KHÔNG DC CHẠY FILE NÀY, NÓ CHỈ LÀ VÍ DỤ!!!

# Chặn tất cả chiều vào, mở tất cả chiều ra
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp  # cho phép ssh
sudo ufw allow 123/udp # cho phép wireguard (đổi port để nén firewall trường)
sudo ufw allow in on wt0 # cho phép giao diện mạng của netbird
sudo ufw allow 54782 # cho phép port của qbittorrent

# Bật ufw
sudo ufw enable
# Tắt ufw
sudo ufw disable

# Kiểm tra lại trạng thái
sudo ufw status verbose

# Reload config
sudo ufw reload

# Xoá luật trong ufw
sudo ufw delete allow 443/udp