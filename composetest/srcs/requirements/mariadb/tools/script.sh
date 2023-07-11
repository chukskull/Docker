#!/bin/bash


if  [ ! -d /var/lib/mysql/mariadb ]; then
    echo "SURE"
    service mariadb start

mysql << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PW';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF
fi
echo "exec"
exec "$@"
