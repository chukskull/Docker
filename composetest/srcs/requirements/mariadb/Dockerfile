# Start from a Debian image.
FROM debian:buster

# Make sure the package repository is up to date.
RUN apt-get update

# Install MariaDB.
RUN apt-get install mariadb-server -y

COPY ./script.sh .


RUN chmod +x script.sh

RUN sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose port 3306 for the database
EXPOSE 3306
# RUN sed -i 's/bind-address/#bind-adress = 0.0.0./' /etc/mysql/mariadb.conf.d/50-server.cnf


# Start the MariaDB server when the container is run.

ENTRYPOINT [ "./script.sh" ]
CMD [ "mysqld" ]