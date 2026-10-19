# Cài đặt môi trường dành cho Control Node.

## 1. Thêm ssh key vào máy.
- Tự gen ssh key ``ssh-keygen -t ed25519``
- Hoặc Thêm folder ``.ssh`` nếu ko có
    ```
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    ```
- Thêm khoá: 
    ```
    nano ~/.ssh/id_ed25519
    nano ~/.ssh/id_ed25519.pub
- Cấp quyền, tránh lỗi: 
    ```
    chmod 600 ~/.ssh/id_ed25519
    chmod 644 ~/.ssh/id_ed25519.pub
    ```
- Đẩy lên public key lên server: 
    ```
    ssh-copy-id prouser@192.168.1.7
    ```
- Test cái.
    ```
    ssh prouser@192.168.1.7
    # Không phải nhập pass là ok
    ```
- **Extra**: tắt nhập mật khẩu khi nhập ``sudo``:
    - Sửa file ``/etc/sudoers``
    - Thêm: ``prouser ALL=(ALL) NOPASSWD: ALL``
    - Ko phải gõ lại mật khẩu khi chạy playbooks
    - Kết nối vào ssh vẫn yêu cầu mật khẩu hoặc Private key

## 2. Cài đặt ansible
- Cài đặt python và pipx trên Debian-based distro
    ```
    sudo apt update
    sudo apt install pipx python3-dev python3-pip python3-venv python3-virtualenv
    ```
- Thêm pipx vào PATH
    ```
    pipx ensurepath
    ```
- Restart shell
- Cài ansible
    ```
    pipx install --include-deps ansible
    ```
- Test cái
    ```
    ansible
    ```
## 3. Cài đặt sau cùng
- Sửa ip nếu cần thiết [host.ini](../../inventory/hosts.ini)
- Thêm mật khẩu có sẵn
    ```
    nano ~/.ansible_vault_pass
    ```
- Sửa file ``secrets.yml`` nếu khi chạy playbook báo lỗi
    ```
    EDITOR=nano ansible-vault edit vars/secrets.yml
    ```    
   ``edit`` -> ``create`` để tạo nếu fuck up.
## 4. Nhảy sang [ManagedNodeSetup.md](./ManangedNodeSetup.md)
