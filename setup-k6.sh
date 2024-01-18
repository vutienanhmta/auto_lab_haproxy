#!/bin/bash
sudo apt-get update
sudo apt-get install -y gnupg2

# Thêm kho lưu trữ k6 và cài đặt k6
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt-get update
sudo apt-get install -y k6

# Đây là nơi bạn có thể thêm script kiểm thử tải của mình, ví dụ:
cat <<EOF | tee load-test.js
import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
  http.get('http://192.168.56.10'); // Địa chỉ của HAProxy
  sleep(1);
}
EOF

# Lệnh để chạy k6 (có thể chạy sau khi vagrant up hoàn tất)
# k6 run load-test.js

