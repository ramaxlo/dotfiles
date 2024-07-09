#!/bin/bash

cmd() {
	echo "[RUN] $*"
	if ! $*; then
		exit 1
	fi
}

########
# MAIN #
########

