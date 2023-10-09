{config, lib, pkgs, specialArgs, ...}:

{
  imports = if specialArgs.hostname == "punished" then
  [
    ./firefox.nix
  ];
  if else specialArgs.hostname == "solid" then
  [
    ./firefox.nix
  ];
  else [];
}
