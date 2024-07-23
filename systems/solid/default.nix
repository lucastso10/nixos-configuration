{ pkgs, lib, config, ... }: {
  imports = [ ./hardware.nix ./boot.nix ];

  config = {
    networking.hostName = "solid";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.shell.enable = true;
    desktop.nerdfont.enable = true;
    desktop.gnome.enable = true;

    apps.alacritty.enable = true;
    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
    apps.roblox.enable = false;
    apps.virt-manager.enable = true;
    apps.ssh.enable = true;

    networking.firewall.enable = false;
  };
}
