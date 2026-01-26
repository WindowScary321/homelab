# Một số câu lệnh hữu ích khi sử dụng Ansible.

## 1. `ansible-playbook`
- ``--Check`` cái, các thay đổi sẽ ko dc apply trên server.
    ```
    ansible-playbook playbooks/deploy_portainer.yml --check 
    ```
- ``--diff`` kiểm tra các thay đổi với file cũ và mới.
    ```
    # kết hợp với --check cho chắc
    ansible-playbook playbooks/deploy_portainer.yml --check --diff 
    ```
- ``--syntax-check`` cái tên nói lên tất cả.
    ```
    ansible-playbook playbooks/deploy_portainer.yml --syntax-check
    ```
- `-v`, `-vv`, `-vvv`, `-vvvv` xuất ra output để debug.
    ```
    #dùng -v thôi dm, mấy cái còn lại dài vcl
    ansible-playbook playbooks/deploy_portainer.yml -v
    ```
- `--step` sau mỗi bước, ansible sẽ hỏi có chạy tiếp hay ko ?
    ```
    ansible-playbook playbooks/deploy_portainer.yml --step
    ```
- `--start-at-task` chạy ở task nào, debug cái.
    ```
    ansible-playbook playbooks/deploy_portainer.yml --start-at-task
    ```

## 1. `ansible`
- Ping cái:
    ```bash
    ansible all -m ping
    ```
- Kiểm tra dung lượng ổ cứng:
    ```bash
    ansible homelab -a "df -h"
    ```
- Restart server:
    ```bash
    ansible homelab -a "reboot" --become
    ```
- Cài 1 phần mềm bất kỳ từ apt:
    ```bash
    ansible homelab -m apt -a "name=htop state=present" --become
    ```
## 2. `ansible-console`
- Tạo 1 shell tương tác giống dành cho server (trông khá xấu):
    ```
    ansible-console homelab
    ```
## 2. `ansible-inventory`
- Xem danh sách máy dưới dạng Graph:
    ```bash
    ansible-inventory --graph
    ```
## 3. `ansible-doc`
- Tra cứu cách dùng module docker_container:
    ```bash
    ansible-doc community.docker.docker_container
    ```
- Liệt kê tất cả các module đang có:
    ```bash
    ansible-doc -l
    ```

## 4. `ansible-galaxy`, `ansible-vault`
- Tìm hiểu sau