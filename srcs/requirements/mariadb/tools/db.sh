#!bin/sh

# if  [! -d "var/lib/mysql/wordpress" ]; then

service mariadb start
sleep 2

mariadb -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

# Shutdown mariadb to restart with new config
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Restart mariadb with new config in the background to keep the container running
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
# mariadb --user=mysql 

# #'%' is a wildcard that matches any host, 0.0.0.0 
# echo "\
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT}'
# CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
# CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASS}';
# GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
# FLUSH PRIVILEGES;" > /tmp/create_db.sql

# mariadb --user=mysql < /tmp/create_db.sql
# rm -f /tmp/create_db.sql


# fi

