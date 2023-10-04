#!/bin/sh
pushd ~/nixos-config
sudo nix flake update
popd
