#!/bin/bash

# This setup configuration file installs
# and configure the following packages:
# -> Nginx Web Server
# -> MariaDB
# -> phpMyAdmin
# -> WordPress CMS

USER=cadet
PASSWD=42saopaulo

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

# OpenSSL Key Generation
openssl req -x509 -out $NGINX_DIR/localhost.crt -keyout $NGINX_DIR/localhost.key \
	-newkey rsa:2048 -nodes -sha256 \
	-subj '/CN=localhost' -extensions EXT -config <( \
	printf	"[dn]\n
			CN=localhost\n
			[req]\n
			distinguished_name = dn\n
			[EXT]\nsubjectAltName=DNS:localhost\n
			keyUsage=digitalSignature\n
			extendedKeyUsage=serverAuth")

# Database Setup and Configuration
# service mysql start
mysql -u root -e	"CREATE USER '$USER' IDENTIFIED BY '$PASSWD';\
					 GRANT ALL PRIVILEGES TO '$USER'@'localhost';"

# phpMyAdmin Installation and Configuration
mkdir $PHPMYADMIN_DIR
tar -C $PHPMYADMIN_DIR -xf /tmp/$PHPMYADMIN_PACKAGE --strip-components 1

# Wordpress Installation and Configuration
mkdir $WORDPRESS_DIR
tar -C $WORDPRESS_DIR -xf /tmp/$WORDPRESS_PACKAGE --strip-components 1

# Permissions Changes
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
