#!/bin/sh
pushd ~/.dotfiles
nix flake update
nix build .#homeConfigurations.ptc.activationPackage
./result/activate
popd
