#!/bin/sh

pushd ~/.dotfiles

if [ ! -z $1 ]; then
	export HOST=$1
else
	export HOST=$(hostname)
fi

nix flake update
sudo nixos-rebuild --flake .#$HOST switch

#nix flake update
#sudo nixos-rebuild switch --flake .#

popd
