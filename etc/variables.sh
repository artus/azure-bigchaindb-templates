#!/bin/bash

#
# Variables
#

#
# Functions
#

function check_installed {
	if [ $(command -v "$1" | wc -l) -eq 0 ]; then 
		echo "false";
	else 
		echo "true";
	fi;
}

function check_azure_login {
	if [ $(az account show | wc -l) -eq 0 ]; then
		echo "false";
	else
		echo "true";
	fi;
}