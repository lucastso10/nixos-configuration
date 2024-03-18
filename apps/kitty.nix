{ lib, config, pkgs, home-manager, ... }:

{
  options = with lib; { apps.kitty = { enable = mkEnableOption "kitty"; }; };

  config = lib.mkIf config.apps.kitty.enable {

    home-manager.users."bolofofo" = {
      programs.kitty = {
        enable = true;
        theme = "Alucard";

        font = lib.mkIf config.desktop.nerdfont.enable {
          name = config.desktop.nerdfont.font;
          size = config.desktop.nerdfont.size;
        };
      };
    };

  };
}
