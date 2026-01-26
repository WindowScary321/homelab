# homelab

## 0. Lưu ý.
- T sẽ dùng debian wsl cho dễ, dm arch khổ dâm vl.

## 1. Cài đặt môi trường.
### 1.1. Thêm ssh key vào máy.
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
### 1.2. Cài đặt pip và ansible
- Cài pip, nếu cần python thì cài thêm.
    ```
    sudo apt update
    sudo apt install pipx python3-dev python3-pip python3-venv python3-virtualenv
    ```
- Thêm pipx vào PATH:
    ```
    pipx ensurepath
    ```
- Cài ansible:
    ```
    pipx install --include-deps ansible
    ```