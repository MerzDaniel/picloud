FROM resin/rpi-raspbian

RUN sudo apt-get update
RUN sudo apt-get install apache2 php5 php5-gd php-xml-parser php5-intl
RUN sudo apt-get install php5-sqlite php5-mysql smbclient curl libcurl3 php5-curl

RUN sudo usermod -aG www-data www-data

RUN sudo apt install wget

RUN wget "https://download.owncloud.org/community/owncloud-10.0.9.tar.bz2" -O /owncloud.tar.bz2
RUN cd /var/www/html

RUN sudo apt install bzip2

RUN sudo tar xfj /owncloud.tar.bz2 -C /var/www/html
RUN sudo chown -R www-data:www-data /var/www/html
# RUN sudo service apache2 start
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
#RUN sudo service apache2 restart
