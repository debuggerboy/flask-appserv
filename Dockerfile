FROM alpine:latest
MAINTAINER Darkload <debuggerboy@gmail.com>

RUN apk add --update nginx supervisor bash curl git python python-dev py-pip build-base && pip install virtualenv && rm -rf /var/cache/apk/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

WORKDIR /app

COPY appserv.conf /etc/nginx/conf.d
COPY uwsgi.ini /etc/uwsgi/
COPY supervisord.conf /etc/supervisord.conf

COPY ./app /app

CMD ["/usr/bin/supervisord"]