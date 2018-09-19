FROM resin/rpi-raspbian

RUN sudo apt-get update
RUN sudo apt-get install apache2 php5 php5-gd php-xml-parser php5-intl
RUN sudo apt-get install php5-sqlite php5-mysql smbclient curl libcurl3 php5-curl

RUN sudo usermod -aG www-data www-data

ADD dist/owncloud.tar.bz2 /var/www/html
COPY resources/owncloud-start.sh owncloud-start.sh

CMD /bin/bash owncloud-start.sh
