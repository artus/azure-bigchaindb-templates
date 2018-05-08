#!/bin/bash

# Artus Vranken

# ======================================================
#
# BigchainDB deployment templates for azure help-script.
#
# ======================================================

VARIABLES="$(pwd)/etc/variables.sh";
DEPLOYMENT="$1";

#
# Start
#

case "$DEPLOYMENT" in
	single-simple)
		cd "development/single-simple";
		bash "single-simple.sh";
		;;

	*)
		echo "No valid deployment specified...";
		exit 1;
		;;
esac;

