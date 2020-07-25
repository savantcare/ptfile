#!/bin/bash

# Installing app from https://github.com/nektos/act
brew install nektos/tap/act

# Download the full ubuntu image to make env similar to github https://github.com/nektos/act#alternative-runner-images
docker run --rm -it --entrypoint "" nektos/act-environments-ubuntu:18.04-full ls

# This will automatically pick up workflows/build.yml
act -P ubuntu-18.04=nektos/act-environments-ubuntu:18.04-full
