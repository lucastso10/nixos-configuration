{pkgs, lib, config, ...}:

with lib;
{
  imports = [ 
  ./hardware.nix
  ./boot.nix
  ];

  config = {
    networking.hostName = "punished";

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
    apps.lutris.enable = true;
  };
}
