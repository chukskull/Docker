
FROM debian:buster

RUN apt-get update && apt-get install -y nginx \
     openssl

RUN mv /etc/ssl /etc/nginx/

RUN unlink /usr/lib/ssl/private \
     && unlink usr/lib/ssl/openssl.cnf \
     && unlink usr/lib/ssl/certs

RUN ln -s /etc/nginx/ssl/openssl.cnf usr/lib/ssl/openssl.cnf \
     && ln -s /etc/nginx/ssl/private usr/lib/ssl/private \
     && ln -s /etc/nginx/ssl/certs usr/lib/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private/nginx-selfsigned.key -out /etc/nginx/ssl/certs/nginx-selfsigned.crt \
                 -subj "/C=MA/ST=snagat/L=snagat42/O=Security/OU=IT Department/CN=www.snagat42.com"

RUN rm -rf /etc/nginx/sites-enabled/nginx.conf

COPY nginx.conf /etc/nginx/sites-enabled/

COPY index.html /var/www/html/

EXPOSE 81 443

CMD ["nginx", "-g", "daemon off;"]