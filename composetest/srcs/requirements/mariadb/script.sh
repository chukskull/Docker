#!/bin/bash

service mysql start


mysql -u root -p$MYSQL_ROOT_PW -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -u root -p$MYSQL_ROOT_PW -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PW';"

mysql -u root -p$MYSQL_ROOT_PW -e "FLUSH PRIVILEGES;"

mysql -u root -p$MYSQL_ROOT_PW -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"

mysql -u root -p$MYSQL_ROOT_PW  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"

mysql -u root -p$MYSQL_ROOT_PW -e "FLUSH PRIVILEGES;"


kill `cat /var/run/mysqld/mysqld.pid`
exec "$@"
