{ ... }:
{
  imports = [
    ./hardware.nix
    ./boot.nix
  ];

  config = {
    networking.hostName = "punished";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.shell.enable = true;
    desktop.nerdfont.enable = true;
    desktop.hyprland.enable = true;

    desktop.hyprland.monitors = [
      "DP-2, 2560x1440@180, 0x0, 1"
      "DP-3, 1920x1080@180, 2560x0, 1"
    ];

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.lutris.enable = true;
    apps.ssh.enable = true;
    apps.docker.enable = true;
    apps.prism.enable = true;
    apps.virt-manager.enable = true;
    apps.vr.enable = true;
    apps.steam.enable = true;
    apps.discord.enable = true;
    apps.ghostty.enable = true;
    apps.zen-browser.enable = true;

    networking.firewall.enable = true;
  };
}
