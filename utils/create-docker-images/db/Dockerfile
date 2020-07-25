FROM ubuntu:20.04

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get install -y mariadb-server

RUN apt-get install -y supervisor

COPY etc-supervisor-conf.d-services.conf /etc/supervisor/conf.d/services.conf

# Docker container runs as long as the command you specify with CMD, ENTRTYPOINT or through the command line is running. 
# Setting deamon off so that nginx runs in the foreground and does not exit.
# I am using CMD instead of entrypoing since CMD can be overridden on the command line easily
# ref: https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/
# nginx has to be last command since it is running in daemon off. Hence it never returns control and hhence if service redis-server start is specified after nginx it will not start.
CMD ["/usr/bin/supervisord", "-n","-c","/etc/supervisor/supervisord.conf"]
