FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN chmod 600 /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=Tetouan/L=MED/O=1337/CN=yhachami.42.fr"

# create the wordpress directory
RUN mkdir -p /var/www/html/wordpress
RUN chmod 777 /var/www/html/wordpress

# copy the nginx configuration file to container
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
