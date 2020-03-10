FROM debian:buster-slim

WORKDIR /var/www/ft_server/public_html
COPY srcs/ft_server.conf /etc/nginx/sites-available/
# COPY srcs/config.inc.php phpmyadmin/
COPY srcs/phpMyAdmin-5.0.1-all-languages.tar /tmp/
COPY srcs/wordpress-5.3.2.tar.gz /tmp/
COPY srcs/setup.sh /tmp/

RUN apt-get update && apt-get install -y \
	nginx \
	openssl \
	mariadb-server \
	php7.3 php7.3-fpm php7.3-mysql
RUN bash /tmp/setup.sh

EXPOSE 80 443

ENTRYPOINT ["tail", "-f", "/dev/null"]
#CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/bin/bash"]
