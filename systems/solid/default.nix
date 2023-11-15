{pkgs, lib, config, ...}:

with lib;
{
  imports = [ 
  ./hardware.nix
  ./boot.nix
  ];

  config = {
    networking.hostName = "solid";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
  };
}
