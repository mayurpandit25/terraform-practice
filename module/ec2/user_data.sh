#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx 
sudo systemctl enable nginx
sudo echo "<h1> Hello World! </h1>" > /var/www/html/index.html
