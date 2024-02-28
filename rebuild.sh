#!/bin/sh
pushd ~/nixos-config

nix fmt

git diff -U0 *.nix

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch --flake .# &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

popd

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
