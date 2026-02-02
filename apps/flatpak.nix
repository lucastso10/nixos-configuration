{
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.flatpak = {
      enable = mkEnableOption "flatpak";
    };
  };

  config = lib.mkIf config.apps.flatpak.enable {
    services.flatpak.enable = true;
  };
}
