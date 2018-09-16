FROM resin/rpi-raspbian

RUN sudo apt-get update
RUN sudo apt-get install apache2 php5 php5-gd php-xml-parser php5-intl
RUN sudo apt-get install php5-sqlite php5-mysql smbclient curl libcurl3 php5-curl

RUN sudo usermod -aG www-data www-data

ADD owncloud.tar.bz2 /var/www/html

RUN find /var/www/html/owncloud \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data

EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
