#!/bin/bash


 MYSQL_ROOT_PW=fes123
 MYSQL_DATABASE=mariadb
 MYSQL_USER=sngt
 MYSQL_PW=fes123
 TITLE=inception
 DOMN=snagat.42.fr
 ADMNUSR=snagat
 ADMNPW=fes123
 ADMN_EMAIL=snagat@gmail.com
 USR=salh
 USR_EMAIL=salh@gmail.com
 USRPW=fes123

mkdir /run/php


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# echo `php wp-cli.phar --info`

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html/
cd /var/www/html



wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php


wp config set DB_NAME $MYSQL_DATABASE --allow-root
wp config set DB_USER $MYSQL_USER --allow-root
wp config set DB_PASSWORD $MYSQL_PW --allow-root
wp config set DB_HOST $MYSQL_DATABASE --allow-root



wp core install --url=$DOMAIN_NAME --title=$TITLE  --admin_user=$ADMNUSR --admin_password=$ADMNPW--admin_email=$ADMN_EMAIL --allow-root

wp user create $USR $USR_EMAIL --user_pass=$USRPW --allow-root


# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --acte

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# wp redis enable --allow-root

sleep 10000

# wp core install --url=example.com --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com --allow-root

