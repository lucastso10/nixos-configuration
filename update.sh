#!/bin/sh
pushd ~/nixos-configuration
sudo nix flake update
popd
