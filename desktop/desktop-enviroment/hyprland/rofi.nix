{
  lib,
  config,
  pkgs,
  home-manager,
  ...
}:
{

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.rofi = {
      enable = true;

      font = config.desktop.nerdfont.font;

      location = "top";

      plugins = with pkgs; [
        rofi-systemd
        rofi-screenshot
        rofimoji
      ];

      terminal = "${pkgs.kitty}/bin/kitty";
    };
  };
}
