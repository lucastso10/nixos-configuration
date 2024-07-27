{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = with lib; {
    desktop.nerdfont = {
      enable = mkEnableOption "nerdfont";

      font = mkOption {
        type = types.str;
        default = "Hack";
        description = ''
          the nerdfont to download
        '';
      };

      size = mkOption {
        type = types.int;
        default = 13;
        description = ''
          use this size to any app that allows it
        '';
      };
    };
  };

  config = lib.mkIf config.desktop.nerdfont.enable rec {
    fonts = {
      packages = with pkgs; [
        (nerdfonts.override {
          fonts = [
            config.desktop.nerdfont.font
            "NerdFontsSymbolsOnly"
          ];
        })
      ];

      fontconfig = {
        defaultFonts = {
          monospace = [
            "NerdFontsSymbolsOnly"
            config.desktop.nerdfont.font
          ];
        };
      };
    };
  };
}
