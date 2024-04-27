#/bin/sh

USERNAME=$(whoami)

pushd ~/.dotfiles

if [ $USERNAME = "ptc" ]; then
	if [ ! -z $1 ]; then
		export HOST=$1
	else
		export HOST=$(hostname)
	fi
	echo "pre-ok"
	nix flake update
	sudo nixos-rebuild switch --flake .#$HOST
	echo "ok"
else
	echo "notok"
fi
