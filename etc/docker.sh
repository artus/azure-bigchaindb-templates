#!/bin/bash

# Remove old docker installation
sudo apt-get remove docker docker-engine docker.io;

# Install docker-ce using the convenience scripts
curl -fsSL get.docker.com -o get-docker.sh;
sudo sh get-docker.sh;

# add current user to docker group
sudo usermod -aG docker $(whoami);
