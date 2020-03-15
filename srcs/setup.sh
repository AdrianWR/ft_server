#!/bin/bash

# This setup configuration file installs
# and configure the following packages:
# -> Nginx Web Server
# -> MySQL
# -> phpMyAdmin
# -> WordPress CMS

ROOT_DIR=/var/www/ft_server/public_html
NGINX_DIR=/etc/nginx

PHPMYADMIN_PACKAGE=phpMyAdmin-5.0.1-all-languages.tar
PHPMYADMIN_DIR=$ROOT_DIR/phpmyadmin

WORDPRESS_PACKAGE=wordpress-5.3.2.tar.gz
WORDPRESS_DIR=$ROOT_DIR/wordpress

# NGINX Server Configuration
mkdir -p $ROOT_DIR
rm $NGINX_DIR/sites-enabled/default
ln -s /etc/nginx/sites-available/ft_server.conf /etc/nginx/sites-enabled/
echo -e "127.0.0.1	ftserver" >> /etc/hosts
source $ROOT_DIR/autoindex.sh $AUTO_INDEX

# OpenSSL Key Generation
/tmp/certificate_authority.sh

# Database Setup and Configuration
service mysql start
mysql -e "CREATE USER '$USER' IDENTIFIED BY '$PASSWD';"
mysql -e "CREATE DATABASE phpmyadmin;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$USER';"

# phpMyAdmin Installation and Configuration
mkdir $PHPMYADMIN_DIR
tar -C $PHPMYADMIN_DIR -xf /tmp/$PHPMYADMIN_PACKAGE --strip-components 1
mysql phpmyadmin < /tmp/phpmyadmin.sql

# Wordpress Installation and Configuration
mkdir $WORDPRESS_DIR
tar -C $WORDPRESS_DIR -xf /tmp/$WORDPRESS_PACKAGE --strip-components 1
mysql wordpress < /tmp/wordpress.sql

# Permissions Changes
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
