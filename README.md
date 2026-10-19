# homelab stuffs

## 1. Giới thiệu.
Đây là 1 số "attempt" self-host của t sử dụng _ansible_, _docker_ và _linux shell_ nhắm mục đích và học tập [IAC](https://viblo.asia/p/infrastructure-as-code-la-gi-tai-sao-lai-chon-terraform-LzD5dwrEljY). Các setup này hoàn toàn nhằm mục đích cá nhân nên sẽ có (nhiều) vấn đề trong quá trình vận hành.

## 2. Setup môi trường.

Cấu trúc dự án:      
- docker-compose (Chứa các compose triển khai bên trong Portainer)
    - [caddy](./docker-compose/caddy.yml)
    - [maicac](./docker-compose/maicac.yml) (ít dc sử dụng)
    - [navidrome](./docker-compose/navidrome.yml)
    - [qbittorrent](./docker-compose/qbittorrent.yml)
    - [watchtower](./docker-compose/watchtower.yml)
    - [wireguard](./docker-compose/wireguard.yml) (đã dc thay thế bằng netbird)
- docs
     - [Control Node Initial Setup](./docs/InitialSetup/ControlNodeSetup.md): các setup lần đầu của control node
     - [Mananged Node Setup](./docs/InitialSetup/ManangedNodeSetup.md): các setup lần đầu của managed node
     - [Ansible Usefull Commands](./docs/CoolStuffs/UsefullCommands.md): các command hữu ích khi sử dụng ansible
- inventory
    - [hosts.ini](./inventory/hosts.ini): chứa các host sẽ dc sử dụng bởi playbooks
- playbooks
    - [docker_images](./playbooks/docker_images/): các docker quan trọng
    - [maintains_manged_nodes](./playbooks/maintains_manged_nodes/): playbooks quản lý các **managed node**
- vars
    - [global.yml](./vars/global.yml): biến toàn cục, ko quá nguy hiểm
    - [secrets.yml](./vars/secrets.yml): biến bí mật, chứa api key hay các thông tin cần dc bảo mật
- [ansible.cfg](./ansible.cfg): config tổng của toàn bộ playbook
    
## 3. Mục tiêu tương lai
- Tìm hiều thêm về IAC, viết blog ghi lại cập nhật của từng commit vào 1 folder riêng.

## 4. Other
- [Odoo 19 install script](https://github.com/SadHilarious/odoo19-install-script): Phiên bản Odoo "lậu" sử dụng để thực hành môn [ISM302](https://cmshn.fpt.edu.vn/course/index.php?categoryid=436)