# Start from a Debian image.
FROM debian:stable

# Update.
RUN apt-get update

# Install MariaDB.
RUN apt-get install mariadb-server expect -y

# Copy Script
COPY ./tools/script.sh .

# Permission
RUN chmod +x script.sh

# Expose port 3306 for the database
EXPOSE 3306
#Change Bind-Adress to 0.0.0.0
RUN sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf \
    && sed -i 's/# port = 3306/port = 3306/' /etc/mysql/mariadb.cnf

ENTRYPOINT [ "./script.sh" ]

CMD [ "mysqld_safe" ]