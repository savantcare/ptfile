vk-tech@vk-mini-layer2-3 ~/g/s/p/u/c/db> docker build .

vk-tech@vk-mini-layer2-3 ~/g/s/p/u/c/db> docker run 9c1f27148b1f
(if supervisor is running it will not exit)

docker run b23ea4f79cef "systemctl status mariadb.service"

docker run -ti 4873bdfa5629 /bin/bash

Q) What are the steps to make a docker image available on docker hub?

docker login --username=savantcare

docker build -t savanatcare/emrmysql . # this creates a image with the name emrmysql

docker push savantcare/emrmysql:latest

https://stackoverflow.com/a/35809320
vk-tech@vk-mini-layer2-3 ~/g/s/p/u/c/db> docker tag 8bab8a4ea48d docker.io/savantcare/emrmysql
vk-tech@vk-mini-layer2-3 ~/g/s/p/u/c/db> docker push docker.io/savantcare/emrmysql:latest
