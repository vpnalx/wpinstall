#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y apache2 mariadb-server mariadb-client php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
sudo systemctl restart apache2

sudo mysql -uroot -e "create database wordpress"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'Superstrong7887pwd'"
sudo mysql -uroot -e "FLUSH PRIVILEGES"

sudo wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo cp -a wordpress/. /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 775 /var/www/html/

sed -e "s/database_name_here/wordpress/" -e "s/username_here/wordpressuser/" -e "s/password_here/Superstrong7887pwd/" /var/www/html/wp-config-sample.php > /var/www/html/wp-config.php


SALT=$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)
STRING='put your unique phrase here'
printf '%s\n' "g/$STRING/d" a "$SALT" . w | sed -s /var/www/html/wp-config.php




