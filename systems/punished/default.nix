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
      "DP-3, 1920x1080@180, 2560x360, 1"
    ];

    desktop.hyprland.workspaces = [
      "1 , monitor:DP-2, default:true"
      "2 , monitor:DP-2"
      "3 , monitor:DP-2"
      "4 , monitor:DP-2"
      "4 , monitor:DP-2"
      "5 , monitor:DP-2"
      "6 , monitor:DP-3, default:true"
      "7 , monitor:DP-3"
      "8 , monitor:DP-3"
      "9 , monitor:DP-3"
      "10, monitor:DP-3"
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
      qmk.enable = true;
    };

    networking.firewall.enable = true;
  };
}
