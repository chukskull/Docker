# Use Debian Buster as base image
FROM debian:buster

# Update the system and install necessary packages
# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
#     wget \
#     curl \
#     gnupg \
#     lsb-release \
#     apt-transport-https \
#     ca-certificates \
#     php7.4-fpm \
#     php7.4-mysql \
#     php7.4-xml \
#     php7.4-mbstring \
#     php7.4-gd \
#     php7.4-curl

RUN apt-get update && apt -y install php7.3 php-mysqli php-fpm wget sendmail curl

# # Download and install WordPress
# RUN curl -O https://wordpress.org/latest.tar.gz
# RUN tar xzvf latest.tar.gz
# RUN mkdir -p /var/www/html

# COPY ./simple.php /var/www/html

# Configure PHP-FPM


# ENV MYSQL_ROOT_PW=fes123
# ENV MYSQL_DATABASE=mariadb
# ENV MYSQL_USER=sngt
# ENV MYSQL_PW=fes123
# ENV TITLE=inception
# ENV DOMN=snagat.42.fr
# ENV ADMNUSR=snagat
# ENV ADMNPW=fes123
# ENV ADMN_EMAIL=snagat@gmail.com
# ENV USR=salh
# ENV USR_EMAIL=salh@gmail.com
# ENV USRPW=fes123

# Expose port 9000 for php-fpm
COPY ./script.sh /
RUN chmod 777 /script.sh
EXPOSE 9000
ENTRYPOINT [ "./script.sh" ]
# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]
