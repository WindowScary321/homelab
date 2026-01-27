# Access controls của Cloudflare Zero Trust

## 1. Applications ở mục Access controls.
- **Hãy vào các URL này bằng trình duyệt, ko cần ``curl``.**
- **Url gốc**:
``https://one.dash.cloudflare.com/id_của_acc/access-controls/apps``

- **Thêm applications mới**: thêm ``/add`` vào cuối url trên.
- **Hiển thị danh sách các Application**: 
    ```
    https://dash.cloudflare.com/api/v4/accounts/id_của_acc/access/apps
    ```
    - Chỉ cần chú ý thuộc tính **id** và **type**
- **Truy cập vào Application**:
    ```
    https://one.dash.cloudflare.com/id_của_acc/access-controls/apps/type_ở_trên/id_ở_trên
    ```
- **Dùng api để kiểm tra thông tin của Application**
    ```
    https://dash.cloudflare.com/api/v4/accounts/id_của_acc/access/apps/id_ở_trên
    ```
- **Xoá Application**:
    - Truy cập vào application theo cách trên
    - Mở F12 -> Network
    - Tìm ``https://dash.cloudflare.com/api/v4/accounts/`` 
    - Copy gói tin có ID của applications. [Ví dụ](./.screenshot/image_1.png)
    - Thêm method ``DELETE`` vào đầu của curl. [Ví dụ](./.screenshot/image_2.png)
    - Chạy commands -> Check lại bằng api cho chắc.