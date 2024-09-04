FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysqld
RUN chmod 777 /var/run/mysqld /var/lib/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY /tools/setup_db.sh /
RUN chmod +x /setup_db.sh

CMD ["sh", "/setup_db.sh"]
