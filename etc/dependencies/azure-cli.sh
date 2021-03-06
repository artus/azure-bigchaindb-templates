#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd "$DIR";
source "../variables.sh";

KEY="52E16F86FEE04B979B07E28DB02C46DF417A0893";

if [ "$(check_installed 'az')" == "false" ]; then

    # https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest

    # Install dirmngr
    sudo apt-get install dirmngr -y;

    # Modify source list
    AZ_REPO=$(lsb_release -cs);
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list;

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

if [ "$(check_azure_login)" == "false" ]; then
    az login;
fi;