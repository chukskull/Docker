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

RUN apt-get update && apt -y install php7.3 php-mysqli php7.3-fpm wget sendmail curl



# ENV MYSQL_ROOT_PW=fes123
# ENV MYSQL_DATABASE=mariadb
# ENV MYSQL_USER=sngt
# ENV MYSQL_PW=fes123
# ENV MYSQL_HOST=wordpress
# ENV TITLE=inception
# ENV DOMN=snagat.42.fr
# ENV ADMNUSR=snagat
# ENV ADMNPW=fes123
# ENV ADMN_EMAIL=snagat@gmail.com
# ENV USR=salh
# ENV USR_EMAIL=salh@gmail.com
# ENV USRPW=fes123

# Expose port 9000 for php-fpm
EXPOSE 9000
COPY ./tools/script.sh /
RUN chmod 777 /script.sh

ENTRYPOINT ["./script.sh"]
# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]
