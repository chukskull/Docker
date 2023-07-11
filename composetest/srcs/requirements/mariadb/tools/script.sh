#!/bin/bash

if  [ ! -d /var/lib/mysql/mariadb ]; then
    echo "SURE"
    service mariadb start

mysql << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PW';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';
FLUSH PRIVILEGES;
EOF
fi

exec "$@"
