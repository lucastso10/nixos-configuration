{pkgs, lib, config, ...}:

with lib;
{
  imports = [ 
  ./hardware.nix
  ./boot.nix
  ];

  config = {
    networking.hostName = "punished";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.gnome.enable = true;

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
    apps.roblox.enable = true;
    apps.lutris.enable = true;
  };
}
