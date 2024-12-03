{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    desktop.nerdfont = {
      enable = lib.mkEnableOption "nerdfont";

      font = lib.mkOption {
        type = lib.types.package;
        default = pkgs.nerd-fonts.hack;
        description = ''
          the nerdfont to download
        '';
      };

      size = lib.mkOption {
        type = lib.types.int;
        default = 13;
        description = ''
          use this size to any app that allows it
        '';
      };
    };
  };

  config = lib.mkIf config.desktop.nerdfont.enable {

    home-manager.users."bolofofo".home.packages = [
      pkgs.nerd-fonts.symbols-only
    ];
    fonts = {
      packages = [
        config.desktop.nerdfont.font
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [
            config.desktop.nerdfont.font.name
            pkgs.nerd-fonts.symbols-only.name
          ];
        };
      };
    };
  };
}
