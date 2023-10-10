{config, lib, pkgs, specialArgs, ...}:

{
  imports = if specialArgs.hostname == "punished" then
  [
    ./firefox.nix
    ./vim.nix
  ]
  else if specialArgs.hostname == "solid" then
  [
    ./firefox.nix
  ]
  else [ ];
}
