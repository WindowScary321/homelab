# Cài đặt portainer

## 0. Lưu ý.
- Các docker container từ giờ về sau nên cài đặt tại ``~/docker-data`` (cho dễ debug, dễ ném lên gg drive).

## 1. Cài đặt.
- Chạy
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml
    ```
- Tắt container (Giống ``docker stop``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=stopped"
    ```
- Xoá container (Giống ``docker remove`` hoặc ``docker compose down``)
    ```
    ansible-playbook playbooks/docker_images/deploy_portainer.yml -e "container_state=absent"
    ```