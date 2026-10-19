# Cài đặt môi trường dành cho Managed Node.

## 0. Lưu ý
- Các data của docker container sẽ đều dc lưu trữ tại ``/home/prouser/docker-data`` trên Managed Node.

## 1. Cài đặt Docker.
- Chạy:
    ```bash
    ansible-playbook playbooks/setup_docker.yml
    ```
    - Lưu ý: playbook này sẽ cài thêm ``rclone``, ``ufw``, ``htop`` và ``fastfetch``.
- Test cái:
    ```bash
    docker run hello-world
    ```
- Xoá hello-world image:
    ```bash
    docker rmi hello-world
    ``` 

## 2. Cài đặt Netbird.
- Thêm biến ``netbird_setup_key`` nếu chưa có bằng cách:
    ```bash
    EDITOR=nano ansible-vault edit vars/secrets.yml
    ```
- Sửa các biến toàn cục (nếu muốn) ``homelab_name`` tại [global.yml](../../vars/global.yml).
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
## 3. Cài đặt Treafik Reverse Proxy.
- Chạy: 
    ```bash
    ansible-playbook playbooks/docker_images/deploy_treafik.yml
    ```
- Nếu thấy tasks ``Verify Traefik is listening on port 80`` báo xanh thì ok.
- Thêm các dịch vụ mới vào file playbook và https://app.netbird.io/dns/zones.

## 3. Cài đặt samba (Chia sẻ file dành cho windows, linux, ...)
- Thêm biến ``smb_password`` nếu chưa có.
- Chạy:
    ```bash
    ansible-playbook playbooks/setup_samba.yml
    ```
- Kết nối vào smb từ Windows:
    - Nên sử dụng qua **Netbird VPN**
    - Chuột phải ``This PC``, chọn ``Map network drives...``
    - Chọn kí tự ``Drive``, mục ``Folder`` nhập ``\\ip_client_netbird\\data``
    - Chọn ``Connect using Different crendentials``
        - Username: ``prouser``
        - Password: **Mở lại file secrets.yml**
    - Xong rồi đấy.

## 4. Cài đặt Portainer.
- Chạy:
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml
    ```
- Truy cập vào url, tạo tài khoản:
    ```
    http://homelab.netbird.cloud:9443/
    ```

## 5. Cài đặt Wireguard.
- Mở port ``123/udp`` hoặc đổi về mặc định ``51820/udp`` trong file [này](../../playbooks/docker_images/deploy_wireguard.yml)
- Thêm hoặc xoá peer nếu muốn.
- Chạy
    ```bash
    ansible-playbook playbooks/docker_images/deploy_wireguard.yml
    ```
- Lấy config
    ```bash
    docker logs wireguard # quét mã qr  
    ```
    - hoặc vào ``/home/prouser/docker-data/wireguard/peer_laptop_hoặc_phone`` trên Managed Node.

## 99. Lưu ý
- Tắt container (Giống ``docker stop``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=stopped"
    ```
- Xoá container (Giống ``docker remove`` hoặc ``docker compose down``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=absent"
    ```