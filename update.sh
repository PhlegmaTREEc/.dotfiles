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
	echo "pre-ok lab"
	nix flake update
	nix build .#homeConfigurations.ptclab.activationPackage
	./result/activate
	echo "ok lab"
else
	echo "unknow configuration"
fi

popd
