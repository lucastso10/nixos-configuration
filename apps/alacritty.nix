{
  lib,
  config,
  pkgs,
  home-manager,
  ...
}:

{
  options = with lib; {
    apps.alacritty = {
      enable = mkEnableOption "alacritty";
    };
  };

  config = lib.mkIf config.apps.alacritty.enable {

    home-manager.users."bolofofo" = {
      programs.alacritty = {
        enable = true;

        settings = {
          font =
            let
              default = {
                family = config.desktop.nerdfont.font;
                style = "Regular";
              };
            in
            {
              normal = default;
              bold = default;
              italic = default;
              bold_italic = default;
            };

          colors = {
            background = "#${config.colorScheme.palette.base00}";

            foreground = "#${config.colorScheme.palette.base06}";
          };

        };
      };
    };

  };
}
