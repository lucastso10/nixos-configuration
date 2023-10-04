#!/bin/sh
pushd ~/nixos-config
sudo nixos-rebuild switch --flake .#
popd
