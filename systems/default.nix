{ config, pkgs, hostname, ... }:

let
  inherit hostname;
in {
  if hostname == "punished"; then
    import "./punished.nix"
}
