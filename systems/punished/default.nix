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

    apps = {
      vim.enable = true;
      firefox.enable = true;
      lutris.enable = true;
      ssh.enable = true;
      docker.enable = true;
      prism.enable = true;
      virt-manager.enable = true;
      vr.enable = true;
      steam.enable = true;
      discord.enable = true;
      ghostty.enable = true;
      zen-browser.enable = true;
      flatpak.enable = true;
      cinny.enable = true;
    };

    networking.firewall.enable = true;
  };
}
