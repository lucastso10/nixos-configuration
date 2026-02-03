#!/bin/sh
pushd ~/nixos-configuration

echo "Formatting..."

nix fmt .

git --no-pager diff --minimal

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch --flake .#

popd

#notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
