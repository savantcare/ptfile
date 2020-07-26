## Custom Dockerfile
FROM consol/ubuntu-xfce-vnc
ENV REFRESHED_AT 2018-03-18

# Switch to root user to install additional software
USER 0

# node install instructions are from https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt update
RUN apt -y upgrade
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN apt install -y supervisor

## switch back to default user
USER 0