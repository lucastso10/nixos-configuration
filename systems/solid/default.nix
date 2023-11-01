{pkgs, lib, config, ...}:

with lib;
{
  imports = [ ./hardware.nix ];

  config = {
    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
  };
}
