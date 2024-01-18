#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx

# Đặt một trang web mẫu (thay thế bằng template của bạn)
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Nginx!</title>
</head>
<body>
    <h1>Success! The Nginx server is working!</h1>
</body>
</html>
EOF

sudo systemctl restart nginx

