{config, lib, pkgs, specialArgs, ...}:

{
  imports = [ 
    ./firefox.nix
    ./vim.nix
    ./kitty.nix
  ];
}
