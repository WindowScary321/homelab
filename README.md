# homelab stuffs

## 1. Giới thiệu.
Đây là 1 số "attempt" self-host của t sử dụng _ansible_, _docker_ và _linux shell_ nhắm mục đích và học tập [IAC](https://viblo.asia/p/infrastructure-as-code-la-gi-tai-sao-lai-chon-terraform-LzD5dwrEljY). Các setup này hoàn toàn nhằm mục đích cá nhân nên sẽ có (nhiều) vấn đề trong quá trình vận hành.

## 2. Setup môi trường.
Setup ban đầu:
-
- [ControlNodeSetup](./docs/IntialSetup/EnvSetup.md): setup chính dành cho **Control Node**.
- [ManangedNodeSetup](./docs/IntialSetup/DockerSetup.md): setup chính dành cho **ManagedNode** hay server.
- [DockerContainers](./docs/IntialSetup/DockerContainers.md): cài đặt 1 số container quan trọng (chỉ bao gồm thư mục [docker_images](./playbooks/docker_images/))
- [UsefullCommands](./docs/CoolStuffs/UsefullCommands.md): các commands hữu dụng dành cho **anisble**.

Cấu trúc dự án:      
-
- compose-files (chứa các file docker-compose.yml ko quá quan trọng hoặc chưa đưa vào playbook chính)
    - [qbittorrent](./compose-files/qbittorrent/)
    - [traefik](./compose-files/traefik/): bao gồm thêm 1 file config
- docs
     - [IntialSetup](./docs/IntialSetup/): các setup lần đầu
     - [CoolStuffs](./docs/CoolStuffs/): fun facts
- inventory
    - [hosts.ini](./inventory/hosts.ini): chứa các host sẽ dc sử dụng bởi playbooks
- playbooks
    - [docker_images](./playbooks/docker_images/): các docker quan trọng
    - [maintains_manged_nodes](./playbooks/maintains_manged_nodes/): playbooks quản lý các **managed node**.
- vars
    - [global.yml](./vars/global.yml): biến toàn cục, ko quá nguy hiểm.
    - [secrets.yml](./vars/secrets.yml): biến bí mật, chứa api key hay các thông tin cần dc bảo mật.
- [ansible.cfg](./ansible.cfg): config tổng của toàn bộ playbook.
    
## 3. Mục tiêu tương lai
- Viết nối đống readme ở [ControlNodeSetup.md](./docs/IntialSetup/ControlNodeSetup.md) sau đó là [DockerContainers.md](./docs/IntialSetup/DockerContainers.md)
- Tìm hiều thêm về IAC, viết blog ghi lại cập nhật của từng commit vào 1 folder riêng.
- Đưa [Treafik Proxy](./compose-files/traefik/) làm file playbook chính, sẽ được thực thi nếu **managed node** hiện tại nổ tung.
- Host 1 server maicac hoặc các server game tương tự.
- Host 1 website cơ bản thông qua (Cloudflare tunnel hoặc ko): 
    - Có HTTPS (AMCE challenge).
    - Đặt phía sau Cloudflare Proxy.
    - Thành thạo Treafik, Canndy hoặc nginx.


## 99. Trick lỏd
- Cloudflare zero trust - Application Access Control bypass ở [đây](./docs/CoolStuffs/CFZeroTrust/access-apps.md)