{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.libreoffice = {
      enable = mkEnableOption "libreoffice";
    };
  };

  config = lib.mkIf config.apps.libreoffice.enable {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
  };
}
