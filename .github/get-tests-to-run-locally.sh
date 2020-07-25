#!/bin/bash

echo "\n Step 1/6 Stopping all containers \n"
docker kill $(docker ps -q)

echo "\n Step 2/6 Removing all containers \n"
docker rm $(docker ps -a -q)

# remove all docker images
# docker rmi $(docker images -q)

echo "\n Step 3/6 Deleting the mysql data dir so previous run does not affect this run \n"
rm -rf /tmp/var/

echo "\n Step 4/6 Installing app from https://github.com/nektos/act \n"
brew install nektos/tap/act

echo "\n Step 5/6  Download the full ubuntu image to make env similar to github https://github.com/nektos/act#alternative-runner-images \n"
docker run --rm -it --entrypoint "" nektos/act-environments-ubuntu:18.04-full ls

echo "\n Step 6/6 This will automatically pick up workflows/build.yml \n"
act -P ubuntu-18.04=nektos/act-environments-ubuntu:18.04-full
