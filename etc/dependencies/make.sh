#!/bin/bash

source "../variables.sh";

if [ "$(check_installed 'make')" == "false" ]; then
    sudo apt-get install make;
fi;