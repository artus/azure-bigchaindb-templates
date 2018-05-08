#!/bin/bash

# Artus Vranken

# ======================================================
#
# BigchainDB deployment templates for azure help-script.
#
# ======================================================

#
# Variables
#

VARIABLES="$(pwd)/etc/variables.sh"


#
# Start
#

source "$VARIABLES";

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

# if [ $(check_installed "vi") == "true" ]; then echo "yes"; else echo "no"; fi;
