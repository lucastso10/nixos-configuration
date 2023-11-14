{pkgs, lib, config, ...}:

with lib;
{
  imports = [ 
  ./hardware.nix
  ./boot.nix
  ];

  config = {
    networking.hostName = "solid";

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
  };
}
