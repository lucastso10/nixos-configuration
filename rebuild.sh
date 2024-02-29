#!/bin/sh
pushd ~/nixos-config

nix fmt

git diff -U0 *.nix

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch --flake .#

popd

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
