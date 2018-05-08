#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd "$DIR";
source "../variables.sh";

# Install docker-compose
if [ "$(check_installed 'docker-compose')" == "false" ]; then
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose;
    sudo chmod +x /usr/local/bin/docker-compose;
fi;
