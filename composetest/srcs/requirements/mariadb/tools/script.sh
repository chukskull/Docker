#!/bin/bash

if  [ ! -d /var/lib/mysql/mariadb ]; then
    service mysql start

    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PW';"
    
   
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"

    mysql -e "FLUSH PRIVILEGES;"

    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"

    mysql -u root -p$MYSQL_ROOT_PW -e "FLUSH PRIVILEGES;"
   
    kill $(cat /var/run/mysqld/mysqld.pid)
fi

exec "$@"
