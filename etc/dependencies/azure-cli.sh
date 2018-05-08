#!/bin/bash

source "../variables.sh";

KEY="52316F86FEE04B979B07E28DB02C46DF417A0893";

if [ "$(check_installed 'az')" == "false"]; then

    # Modify source list
    TEST="$(lsb_release -cs)";
    echo "deb [arch=amd64] https://package.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list;

    # Get the microsoft signing key (deprecated but still runs)
    sudo apt-key adv --keyserver packages.microsoft.com --recv-keys "$KEY";

    # Install the new key
    curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -;

    # Install CLI
    sudo apt-get install apt-transport-https;
    sudo apt-get update && sudo apt-get install azure-cli;

    # az login
    az login;

fi;
