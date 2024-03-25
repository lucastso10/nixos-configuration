{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          heigth = 30;
        };
      };
    };
  };
}
