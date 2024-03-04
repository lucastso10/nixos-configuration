{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.rofi = {
      enable = true;

      font = config.desktop.nerdfont.font;
    };
  };
}
