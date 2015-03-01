# Dockerfile extending the generic Python image with application files for a
# single application.
#FROM google/appengine-python27
FROM zend/php-zendserver

#RUN apt-get update && apt-get install -y fortunes libespeak-dev
#ADD requirements.txt /app/
#RUN pip install -r requirements.txt

ADD ./app/ /var/www/html

#RUN mkdir -p /var/www/html/_ah
#ADD . /var/www/html
RUN apt-get install -y haproxy
COPY ./conf /etc/

#RUN /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -db
COPY usr/local/bin/ /usr/local/bin
