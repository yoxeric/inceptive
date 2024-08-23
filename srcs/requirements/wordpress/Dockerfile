FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install -y php php-fpm php-mysql curl mariadb-client

# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# COPY ./conf/wp-config.php /var/www/html/wordpress/

EXPOSE 9000

COPY ./tools/setup.sh /
RUN chmod +x /setup.sh
ENTRYPOINT ["sh" , "/setup.sh"]

# CMD ["/usr/sbin/php-fpm7.4", "-F"]
