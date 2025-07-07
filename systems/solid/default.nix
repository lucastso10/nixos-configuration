{ ... }:
{
  imports = [
    ./hardware.nix
    ./boot.nix
  ];

  config = {
    networking.hostName = "solid";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.shell.enable = true;
    desktop.nerdfont.enable = true;
    desktop.hyprland.enable = true;
    desktop.hyprland.monitors = [
      "HDMI-A-1, 1920x1080@180, 0x0, 1"
      "DP-3, 1920x1080@60, -1920x0, 1"
    ];

    apps.ssh.enable = false;
    apps.virt-manager.enable = true;
    apps.vim.enable = true;
    apps.docker.enable = true;
    apps.tmux.enable = true;

    apps.firefox.enable = true;
    apps.kitty.enable = true;
    apps.prism.enable = true;
    apps.popcorntime.enable = true;
    apps.ghostty.enable = true;
    apps.steam.enable = true;
    apps.vesktop.enable = true;

    networking.firewall.enable = true;
  };
}
