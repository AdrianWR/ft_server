FROM debian:buster

WORKDIR /var/www/ft_server/public_html

COPY srcs/ft_server.conf /etc/nginx/sites-available/
COPY srcs/wordpress-5.3.2.tar.gz /tmp/
COPY srcs/certificate_authority.sh /tmp/
COPY srcs/domains.ext /tmp/

COPY srcs/phpMyAdmin-5.0.1-all-languages.tar /tmp/
COPY srcs/phpmyadmin.sql /tmp/

COPY srcs/autoindex.sh .
COPY srcs/setup.sh /tmp/
COPY srcs/services.sh /tmp/

# SysAdmin credentials and environment
# variables. Can be passed as arguments
# at build time.
ARG USER=cadet
ARG PASSWD=42saopaulo
ENV AUTO_INDEX on

RUN apt-get update && apt-get install -y \
	nginx \
	openssl \
	mariadb-server \
	php php-fpm php-mysql php-mbstring
RUN /tmp/setup.sh
EXPOSE 80 443 3306

ENTRYPOINT ["tail", "-f", "/dev/null"]
#CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/tmp/services.sh"]
