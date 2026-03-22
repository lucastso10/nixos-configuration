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

    desktop = {
      shell.enable = true;
      nerdfont.enable = true;
      hyprland.enable = true;
    };

    apps = {
      #ssh.enable = false;
      #virt-manager.enable = true;
      vim.enable = true;
      docker.enable = true;
      tmux.enable = true;
      #firefox.enable = true;
      prism.enable = true;
      popcorntime.enable = true;
      steam.enable = true;
      discord.enable = true;
      ghostty.enable = true;
      zen-browser.enable = true;
    };

    networking.firewall.enable = true;
  };
}
