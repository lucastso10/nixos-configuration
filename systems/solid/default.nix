{pkgs, lib, config, ...}:

with lib;
{
  imports = [ ./hardware.nix ];

  config = {
    programs.vim.enable = true;
  };
}
