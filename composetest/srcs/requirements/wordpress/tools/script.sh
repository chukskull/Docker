#!/bin/bash

# MYSQL_ROOT_PW='fes123'
# MYSQL_DATABASE='MARIADB'
# MYSQL_USER='sngt'
# MYSQL_PW='fes123'
MYSQL_HOST='mariadb'
# TITLE='inception'



# DOMN='snagat.42.fr'
# ADMNUSR='snagat'
# ADMNPW='fes123'
# ADMN_EMAIL='snagat@gmail.com'
# USR='salh'
# USR_EMAIL='salh@gmail.com'
# USRPW='fes123'
# MYSQL_ROOT_PW=fes123
# MYSQL_DATABASE=WP
# MYSQL_USER=sngt
# MYSQL_PW=fes123
# TITLE=inception
# DOMN=snagat.42.fr
# ADMNUSR=snagat
# ADMNPW=fes123
# ADMN_EMAIL=snagat@gmail.com
# USR=salh
# USR_EMAIL=salh@gmail.com
# USRPW=fes123



sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf
# sed '/9000/a  ;listen = /run/php/php7.3-fpm.sock' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /var/www/html/



if [ ! -f /var/www/html/wp-config.php ]; then
   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    chmod 777 wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    #changing working dir
    cd /var/www/html

    wp core download --allow-root
    cp wp-config-sample.php wp-config.php


    chmod +x /var/www/html/wp-config.php

	wp config set DB_NAME $MYSQL_DATABASE --allow-root
	wp config set DB_USER $MYSQL_USER --allow-root
	wp config set DB_PASSWORD $MYSQL_PW --allow-root
	wp config set DB_HOST $MYSQL_HOST --allow-root

    wp core install --url=$DOMN --title=$TITLE --admin_user=$ADMNUSR --admin_password=$ADMNPW --admin_email=$ADMN_EMAIL --allow-root

	wp user create $USR $USR_EMAIL --user_pass=$USRPW --allow-root
fi

exec "$@"