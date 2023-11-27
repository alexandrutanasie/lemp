#!/bin/bash
sudo su
#update 
apt update
#install bginx
apt install nginx
#install mysql
apt install mysql-server
service mysql start
sudo mysql
#change root password
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

#install PHP
apt install software-properties-common
add-apt-repository ppa:ondrej/php -y

apt install php7.4-fpm

apt install openssl php7.4-common php7.4-bcmath php7.4-curl php7.4-json php7.4-mbstring php7.4-mysql php7.4-tokenizer php7.4-xml php7.4-zip php7.4-dom php7.4-cli php7.4-gd php7.4-xml php7.4-json php7.4-mcrypt
#create site conf
echo """
server {
    listen 80;
    listen [::]:80;
    server_name example.com;
    root /srv/example.com/public;
 
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
 
    index index.php;
 
    charset utf-8;
 
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
 
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
 
    error_page 404 /index.php;
 
    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }
 
    location ~ /\.(?!well-known).* {
        deny all;
    }
}
""" > /etc/nginx/sites-available/site.example.com
#create symbolic link
ln -s /etc/nginx/sites-available/site.example.com /etc/nginx/sites-enabled/
#restart nginx
service nginx reload
