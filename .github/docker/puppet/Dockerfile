## Custom Dockerfile
FROM consol/centos-xfce-vnc
ENV REFRESHED_AT 2018-03-18

# Switch to root user to install additional software
USER 0

## Install a gedit
RUN yum install -y gedit \
    && yum clean all

## switch back to default user
USER 1000