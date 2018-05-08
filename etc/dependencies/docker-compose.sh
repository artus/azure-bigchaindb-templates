#!/bin/bash

source "../variables.sh";

# Install docker-compose
if [ "$(check_installed 'docker-compose')" == "false" ]; then
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose;
fi;