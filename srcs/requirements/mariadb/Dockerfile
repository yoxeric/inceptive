FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysqld
RUN chmod 777 /var/run/mysqld /var/lib/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

# ADD /tools/db.sh
COPY /tools/db.sh /
RUN chmod +x /db.sh
ENTRYPOINT ["sh", "/db.sh"]

# USER mysql
