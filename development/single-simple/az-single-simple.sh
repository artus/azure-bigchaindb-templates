#!/bin/bash

#
# Read out parameters.
#

GROUP_NAME="$1";
LOCATION="$2";
VM_NAME="$3";

if [ "$GROUP_NAME" == "" ]; then
    GROUP_NAME="group-$RANDOM";
fi;

if [ "$LOCATION" == "" ]; then
    LOCATION="westeurope";
fi;

if [ "$VM_NAME" == "" ]; then
    VM_NAME="vm-$RANDOM";
fi;

#
# Change directory.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd "$DIR";
source "../../etc/variables.sh";

#
# Install dependencies.
#

bash "../../etc/dependencies/azure-cli.sh";

#
# Create a new Resource group and VM.
#

az group create --name "$GROUP_NAME" --location "$LOCATION";
az vm create --resource-group "$GROUP_NAME" --name "$VM_NAME" --image UbuntuLTS --admin-username "admin" --generate-ssh-keys;

#
# Open BigchainDB port.
#

az vm open-port --port 9984 --resource-group "$GROUP_NAME" --name "$VM_NAME";

#
# Install git on VM.
#

az vm run-command invoke -g "$GROUP_NAME" -n "$VM_NAME" --command-id RunShellScript --scripts "sudo apt-get update && sudo apt-get install -y git";

#
# Pull this repository on the VM and run a single node.
# 

az vm run-command invoke -g "$GROUP_NAME" -n "$VM_NAME" --command-id RunShellScript --scripts "git clone https://github.com/artusvranken/azure-bigchaindb-templates.git && cd azure-bigchaindb-templates && bash run.sh single-simple";