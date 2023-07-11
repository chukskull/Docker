# Use Debian Buster as base image
FROM debian:buster

RUN apt-get update && apt -y install php7.3 php-mysqli php7.3-fpm wget sendmail curl

ENV MYSQL_HOST=mariadb

EXPOSE 9000

COPY ./tools/script.sh /

RUN chmod 777 /script.sh

RUN mkdir -p /run/php

ENTRYPOINT ["./script.sh"]

# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]
