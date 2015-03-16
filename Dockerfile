# Zend Server
#
# Version 0.2

# TODO:

#FROM ubuntu:14.04
FROM zend/php-zendserver

ENV ZS_ADMIN_PASSWORD 1234
ENV ZS_PRODUCTION false


#RUN apt-key adv --keyserver pgp.mit.edu --recv-key 799058698E65316A2E7A4FF42EAE1437F7D2C623
#RUN echo "deb http://repos.zend.com/zend-server/8.0/deb_apache2.4 server non-free" >> /etc/apt/sources.list.d/zend-server.list
#RUN apt-get update && apt-get install -y git zend-server-php-5.6 && /usr/local/zend/bin/zendctl.sh stop ;/usr/local/zend/bin/clean_semaphores.sh

#Install haproxy to forward apache to port 8080 for app engine support
COPY ./conf /etc/
RUN apt-get install -y -o Dpkg::Options::=--force-confdef haproxy
######################################################################

COPY ./scripts /usr/local/bin
#COPY ./libmysqlclient.so.18 /usr/lib/x86_64-linux-gnu/
#COPY ./Zray /usr/local/zend/var/zray/extensions/

#RUN rm /var/www/html/index.html
COPY ./app /var/www/html

#EXPOSE 80
#EXPOSE 443
#EXPOSE 10081
#EXPOSE 10082
#EXPOSE 8080

CMD ["/usr/local/bin/run"]
