{
  ...
}:

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
      "HDMI-A-1, 1920x1080@180, 0x0, 1"
      "DP-3, 1920x1080@60, -1920x0, 1"
    ];
    desktop.kde.enable = false;

    apps.vim.enable = true;
    apps.firefox.enable = true;
    apps.kitty.enable = true;
    apps.lutris.enable = true;
    apps.ssh.enable = true;
    apps.docker.enable = true;
    apps.prism.enable = true;
    apps.virt-manager.enable = true;
    apps.vr.enable = true;
    apps.ollama.enable = true;

    networking.firewall = {
      enable = true;
    };
  };
}
