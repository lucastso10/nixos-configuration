{lib, config, pkgs, ...}:
{
  options = with lib; {
    desktop.nerdfont = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          wheter or not to enable nerdfonts on the system
        '';
      };

      font = mkOption {
        type = types.str;
        default = "Hack";
        description = ''
          the nerdfont to download
        '';
      };
    };
  };

  config = lib.mkIf config.desktop.nerdfont.enable {
    fonts = {
      packages = with pkgs; [
        (nerdfonts.override { fonts = [ config.desktop.nerdfont.font ]; })
      ];

      fontconfig = {
        defaultFonts = {
          monospace = [ config.desktop.nerdfont.font ];
        };
      };
    };
  };
}
