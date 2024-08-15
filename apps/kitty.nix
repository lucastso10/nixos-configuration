{
  lib,
  config,
  pkgs,
  home-manager,
  ...
}:

{
  options = with lib; {
    apps.kitty = {
      enable = mkEnableOption "kitty";
    };
  };

  config = lib.mkIf config.apps.kitty.enable {

    home-manager.users."bolofofo" = {
      programs.kitty = {
        enable = true;
        #theme = "Alucard";

        font.size = lib.mkForce 13;

        settings = {
          #background = "#${config.colorScheme.palette.base00}";
          #foreground = "#${config.colorScheme.palette.base06}";
        };
      };
    };

  };
}
