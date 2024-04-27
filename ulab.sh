#!/bin/sh
pushd ~/.dotfiles
nix flake update
nix build .#homeConfigurations.ptclab.activationPackage
./result/activate
popd
