#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y apache2 mariadb-server mariadb-client php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
sudo systemctl restart apache2

sudo mysql -uroot -e "create database wordpress"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'Superstrong7887pwd'"
sudo mysql -uroot -e "FLUSH PRIVILEGES"



