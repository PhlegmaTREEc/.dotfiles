#!/usr/bin/env bash

HOST=$(hostname)

pushd ~/.dotfiles

if [ $HOST = "nixmain" ]; then
	echo "Update of nixmain Desktop started"
	nix flake update
	sudo nixos-rebuild switch --flake .#$HOST
	echo "Update of nixmain Desktop finished"
elif [[ $HOST = nixlxc* ]]; then
	echo "Update of $HOST started"
	nix flake update
	sudo nixos-rebuild switch --flake .#nixlxc --impure
	echo "Update of $HOST finished"
elif [[ $HOST = nixvm* ]]; then
	echo "Update of $HOST started"
	nix flake update
	sudo nixos-rebuild switch --flake .#$HOST
	echo "Update of $HOST finished"
else
	echo "unknow configuration"
fi

popd
