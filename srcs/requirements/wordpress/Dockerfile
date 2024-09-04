FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php php-fpm php-mysql curl mariadb-client

EXPOSE 9000

COPY ./tools/setup_wp.sh /
RUN chmod +x /setup_wp.sh

CMD ["sh" , "/setup_wp.sh"]
