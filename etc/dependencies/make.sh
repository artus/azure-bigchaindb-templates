#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd "$DIR";
source "../variables.sh";

if [ "$(check_installed 'make')" == "false" ]; then
    sudo apt-get install make;
fi;