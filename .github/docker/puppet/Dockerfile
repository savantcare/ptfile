# Why not use official node image?
#   npm install takes a long time

FROM ubuntu:20.04

RUN apt-get update

RUN apt-get -y upgrade

# node install instructions are from https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Ref: https://dotlayer.com/how-to-install-and-configure-puppeteer-on-ubuntu-18-04-lts/
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

RUN apt-get install -y supervisor

# COPY etc-supervisor-conf.d-services.conf /etc/supervisor/conf.d/services.conf

CMD ["/usr/bin/supervisord", "-n","-c","/etc/supervisor/supervisord.conf"]
