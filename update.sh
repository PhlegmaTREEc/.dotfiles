#/bin/sh

USERNAME=$(whoami)

pushd ~/.dotfiles

if [ $USERNAME = "ptc" ]; then
	if [ ! -z $1 ]; then
		export HOST=$1
	else
		export HOST=$(hostname)
	fi
	echo "pre-ok nixmain"
	nix flake update
	sudo nixos-rebuild switch --flake .#$HOST
	echo "ok nixmain"
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
