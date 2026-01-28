# Cài đặt các Docker containers cần thiết.

## 0. Lưu ý.
- Các docker container từ giờ về sau nên cài đặt tại ``~/docker-data`` (cho dễ debug, dễ ném lên gg drive).

## 1. Cài đặt portainer.
- Chạy
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml
    ```
## 2. Cài đặt netbird.
- Lưu ý: thêm biến ``netbird_setup_key`` vào ``secrets.yml``.
- Chạy
    ```
    ansible-playbook playbooks/docker_images/deploy_netbird.yml
    ```
## 2. Cài đặt wireguard.
- Lưu ý: nên đổi port (hiện tại là ``123``).
- Chạy
    ```
    ansible-playbook playbooks/docker_images/deploy_wireguard.yml
    ```

## 99. Lưu ý
- Tắt container (Giống ``docker stop``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=stopped"
    ```
- Xoá container (Giống ``docker remove`` hoặc ``docker compose down``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=absent"
    ```