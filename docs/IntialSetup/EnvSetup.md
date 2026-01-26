# Cài đặt môi trường.

## 0. Lưu ý.
- T sẽ dùng debian wsl cho dễ, dm arch khổ dâm vl.

## 1. Thêm ssh key vào máy.
- Tự gen ssh key ``ssh-keygen -t ed25519``
- Hoặc khổ dâm bằng cách tự thêm vào thư mục home.
- Thêm folder ``.ssh`` nếu ko có
    ```
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    ```
- Thêm khoá private: 
    ```
    nano ~/.ssh/id_ed25519
    chmod 600 ~/.ssh/id_ed25519
    ```
- Thêm khoá public: 
    ```
    nano ~/.ssh/id_ed25519.pub
    ```
- Đẩy lên public key lên server: 
    ```
    ssh-copy-id username@192.168.100.186
    ```
- Test cái.
    ```
    ssh username@192.168.100.186
    # Không phải nhập pass là ok
    ```
- **Extra**: tắt nhập mật khẩu khi nhập ``sudo``:
    - Sửa file ``/etc/sudoers``
    - Thêm: ``username ALL=(ALL) NOPASSWD: ALL``
    - Đỡ phải gõ lại mật khẩu khi chạy playbooks.
    - Kết nối vào ssh vẫn yêu cầu mk hoặc ssh key.

## 2. Cài đặt pip và ansible
- Cài pip, nếu cần python thì cài thêm.
    ```
    sudo apt update
    sudo apt install pipx python3-dev python3-pip python3-venv python3-virtualenv
    ```
- Thêm pipx vào PATH:
    ```
    pipx ensurepath
    ```
- Logout sau đó connect lại vào server.
- Cài ansible:
    ```
    pipx install --include-deps ansible
    ```
- Nhảy sang file [DockerSetup.md](./DockerSetup.md)