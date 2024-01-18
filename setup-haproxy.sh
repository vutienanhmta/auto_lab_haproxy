#!/bin/bash
sudo apt-get update
sudo apt-get install -y haproxy

# Cấu hình HAProxy
cat <<EOF | sudo tee /etc/haproxy/haproxy.cfg
global
    log /dev/log    local0
    log /dev/log    local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin
    stats timeout 30s
    user haproxy
    group haproxy
    daemon

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms

frontend http_front
    bind *:80
    stats uri /haproxy?stats
    default_backend http_back

backend http_back
    balance roundrobin
    server nginx1 192.168.56.11:80 check
    server nginx2 192.168.56.12:80 check
EOF

sudo systemctl restart haproxy

