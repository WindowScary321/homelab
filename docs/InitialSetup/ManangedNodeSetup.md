# Cài đặt môi trường dành cho Managed Node

## 0. Lưu ý
- Các data của docker container sẽ đều dc lưu trữ tại ``/opt/docker-data/`` trên Managed Node
- Tất cả command bên dưới sẽ setup Managed Node qua ansible, ko cần ssh trực tiếp 
## 1. Cài đặt Docker
- Chạy:
    ```bash
    ansible-playbook playbooks/setup_docker.yml
    ```
    - Lưu ý: playbook này sẽ cài thêm ``rclone``, ``ufw``, ``htop`` và ``fastfetch``
- Test docker
    ```bash
    docker run hello-world && docker rmi hello-world
    ``` 

## 2. Cài đặt Netbird
- Thêm biến ``netbird_setup_key``
    ```bash
    EDITOR=nano ansible-vault edit vars/secrets.yml
    ```
- Sửa các biến toàn cục ``homelab_name`` tại [global.yml](../../vars/global.yml).
- Chạy: 
    ```bash
    ansible-playbook playbooks/setup_netbird.yml
    ```
- Test cái:
    ```bash
    netbird status
    ```
- Tắt servie để debug:
    ```bash
    ansible homelab -a "sudo netbird down"
    ```

## 3. Cài đặt samba (Chia sẻ file dành cho windows, linux, ...)
- Thêm biến ``smb_password`` nếu chưa có.
- Chạy:
    ```bash
    ansible-playbook playbooks/setup_samba.yml
    ```
- Kết nối vào smb từ Windows:
    - Chuột phải ``This PC``, chọn ``Map network drives...``
    - Chọn kí tự ``Drive``, mục ``Folder`` nhập ``\\ip_client_netbird\\data``
    - Chọn ``Connect using Different crendentials``
        - Username: ``prouser``
        - Password: **Mở lại file secrets.yml**

## 4. Cài đặt Cloudflare Tunnel và thêm network ``cloudflared_net``
- **Lưu ý:** Chạy playbook này để tạo network cần thiết
- Thêm biến ``cloudflare_tunnel_token`` trong ``vars/secrets.yml``
- Chạy
    ```
    ansible-playbook playbooks/docker_images/deploy_cf_tunnel.yml
    ```

## 5. Cài đặt Portainer
- Chạy
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml
    ```
- Truy cập vào url, tạo tài khoản:
    ```
    https://homelab.netbird.cloud:9443/
    ```

## 6. Cài đặt Caddy Reverse Proxy
- Import [caddy.yml](../../docker-compose/caddy.yml) vào Portainer
- Thêm các subdomain vào file compose và https://app.netbird.io/dns/zones

## 7. Cài đặt Wireguard.
- Import [wireguard.yml](../../docker-compose/wireguard.yml) vào Portainer
- Lấy config kết nối vpn
    ```bash
    docker logs wireguard # quét mã qr  
    ```
    - hoặc vào ``/opt/docker-data/wireguard/peer_laptop_hoặc_phone`` trên Managed Node.

## 8. Lưu ý
- Tắt container (Giống ``docker stop``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=stopped"
    ```
- Xoá container (Giống ``docker remove`` hoặc ``docker compose down``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=absent"
    ```