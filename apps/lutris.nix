{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.lutris = {
      enable = mkEnableOption "lutris";
    };
  };

  config = lib.mkIf config.apps.lutris.enable {
    environment.systemPackages = with pkgs; [
      lutris
      wine
      winetricks
    ];
  };
}
