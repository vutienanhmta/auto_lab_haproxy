#!/bin/bash
sudo apt-get update
sudo apt-get install -y gnupg2

# Install k6
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt-get update
sudo apt-get install -y k6

# create file test
cat <<EOF | tee load-test.js
import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    stages: [
        { duration: '30s', target: 100 }, 
        { duration: '1m', target: 100 },  
        { duration: '30s', target: 0 },  
    ]
};

export default function () {
    let response = http.get('http://192.168.56.10'); // Địa chỉ của HAProxy
    check(response, { 'status was 200': (r) => r.status === 200 });
    sleep(1);
}
EOF

# Lệnh để chạy k6 
# k6 run load-test.js

