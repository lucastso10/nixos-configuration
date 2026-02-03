{
  lib,
  pkgs,
  ...
}:
{
  # determined in stylix
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
}
