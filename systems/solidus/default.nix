{ pkgs, lib, config, ... }:

with lib; {
  imports = [ ./hardware.nix ./boot.nix ];

  config = {
    networking.hostName = "solidus";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.gnome.enable = true;

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
  };
}
