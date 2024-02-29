#!/bin/sh
pushd ~/nixos-config

echo "Formatting..."

nix fmt

git diff

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch --flake .#

popd

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
