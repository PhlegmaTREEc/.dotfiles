#!/usr/bin/env bash

USERNAME=$(whoami)

pushd ~/.dotfiles

if [ $USERNAME = "ptc" ]; then
	if [ ! -z $1 ]; then
		export HOST=$1
	else
		export HOST=$(hostname)
	fi
	echo "Update of nixmain Desktop started"
	nix flake update
	sudo nixos-rebuild switch --flake .#$HOST
	echo "Update of nixmain Desktop finished"
elif [ $USERNAME = "ptclab" ]; then
	if [ ! -z $1 ]; then
		export HOST=$1
	else
		export HOST=$(hostname)
	fi
	echo "Update of $HOST started"
	nix flake update
	sudo nixos-rebuild switch --flake .#$HOST
	echo "Update of $HOST finished"
else
	echo "unknow configuration"
fi

popd
