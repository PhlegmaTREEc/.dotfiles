#!/bin/sh
pushd ~/.dotfiles
nix flake update
sudo nixos-rebuild switch --flake .#
popd
