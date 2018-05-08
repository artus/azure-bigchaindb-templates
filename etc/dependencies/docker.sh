#!/bin/bash

source "../variables.sh";

# Remove old docker installation
sudo apt-get remove docker docker-engine docker.io;

if [ "$(check_installed 'docker')" == "false"]; then

    # Install docker-ce using the convenience scripts
    curl -fsSL get.docker.com -o get-docker.sh;
    sudo sh get-docker.sh;

    # add current user to docker group
    sudo usermod -aG docker $(whoami);

fi;

