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
## 3. Cài đặt samba (Chia sẻ file dành cho windows, linux, ...)
- Thêm biến ``smb_password`` nếu chưa có.
- Chạy:
    ```bash
    ansible-playbook playbooks/setup_samba.yml
    ```
- Truy cập vào Windows:
    - Chuột phải ``This PC``, chọn ``Map network drives...``
    - TODO



## 4. Cài đặt Portainer.
- Chạy:
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml
    ```
- Truy cập vào url, tạo tài khoản:
    ```
    https://ip_của_server:9443 #https
    http://ip_của_serer:9000 #http
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
