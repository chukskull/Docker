# Start from a Debian image.
FROM debian:buster

# Make sure the package repository is up to date.
RUN apt-get update

# Install MariaDB.
RUN apt-get install mariadb-server -y

# Copy Script
COPY ./tools/script.sh .

# Permission
RUN chmod +x script.sh

#Change Bind-Adress to 0.0.0.0
RUN sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose port 3306 for the database
EXPOSE 3306
RUN mkdir /run/php
ENTRYPOINT [ "./script.sh" ]

CMD [ "mysqld_safe" ]