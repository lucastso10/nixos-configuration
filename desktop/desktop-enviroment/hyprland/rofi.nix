{
  lib,
  config,
  pkgs,
  ...
}:
{

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.rofi = {
      enable = true;

      #font = config.desktop.nerdfont.font;

      location = "center";

      plugins = with pkgs; [
        rofi-systemd
        rofi-screenshot
        rofimoji
      ];

      terminal = "${pkgs.kitty}/bin/kitty";
    };
  };
}
