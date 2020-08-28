FROM ubuntu:16.04
MAINTAINER bdhwan@gmail.com


RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y nginx 
RUN apt-get install -y curl 
RUN rm -rf /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default
ADD default_check /etc/nginx/sites-available/default_check

ADD check.sh /home/check.sh
RUN chmod 777 /home/check.sh

RUN rm -rf /var/www/html/*
ADD index.html /var/www/html/index.html

WORKDIR /home

EXPOSE 8080 80 443 3000 8082
HEALTHCHECK --interval=10s --timeout=3s --retries=100 CMD curl --fail http://localhost/index.html || exit 1
ENTRYPOINT ["/bin/sh", "check.sh"]

