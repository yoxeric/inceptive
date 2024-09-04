#!/bin/bash

#install wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# create the wordpress directory
mkdir -p /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress

mkdir -p /run/php/

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    cd /var/www/html/wordpress/
    rm -rf /var/www/html/wordpress/*

    wp core download --allow-root

    wp config create --allow-root \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASS} \
        --dbhost=mariadb:3306

    wp core install --allow-root \
        --url=${DOMAIN_NAME} \
        --title=${WORDPRESS_TITLE} \
        --admin_user=${WORDPRESS_ADMIN} \
        --admin_password=${WORDPRESS_ADMIN_PASS} \
        --admin_email=${WORDPRESS_ADMIN_EMAIL}

    wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} \
        --user_pass=${WORDPRESS_USER_PASS} \
        --role=editor \
        --path=/var/www/html/wordpress --allow-root
        # --role=author \
fi

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F