# Start from a Debian image.
FROM debian:buster

# Make sure the package repository is up to date.
RUN apt-get update

# Install MariaDB.
RUN apt-get install -y mariadb-server
COPY ./script.sh /
RUN chmod +x /script.sh

# Set environment variables (replace 'my-secret-pw' with your desired password)
ENV MYSQL_ROOT_PW=fes123
ENV MYSQL_DATABASE=mariadb
ENV MYSQL_USER=sngt
ENV MYSQL_PW=fes123

# Expose port 6969 for the database
EXPOSE 6969
RUN sed -i 's/bind-address/#bind-adress/' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "./script.sh" ]

# Start the MariaDB server when the container is run.
CMD [ "mysqld" ]