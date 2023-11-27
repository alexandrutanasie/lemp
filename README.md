# talex-lemp
```bash
sudo su
apt update
```
# Installing NGINX
```bash
apt install nginx
service nginx start
```
# Installing MySQL 8.0
```bash
apt update
apt install mysql-server
service mysql start
```
# change root password
```bash
sudo mysql
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
#or 
sudo mysql_secure_installation
```
# find the ip
```bash
hostname -I
```
# Installing PHP 7.4-FPM
```bash
apt install software-properties-common
add-apt-repository ppa:ondrej/php -y
apt install php7.4-fpm
apt install openssl php7.4-common php7.4-bcmath php7.4-curl php7.4-json php7.4-mbstring php7.4-mysql php7.4-tokenizer php7.4-xml php7.4-zip php7.4-dom php7.4-cli php7.4-gd php7.4-xml php7.4-json php7.4-mcrypt
```
