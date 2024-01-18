template web#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx

# Create template web
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

