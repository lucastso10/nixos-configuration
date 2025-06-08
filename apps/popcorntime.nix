{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.popcorntime.enable = mkEnableOption "popcorntime";
  };

  config = lib.mkIf config.apps.popcorntime.enable {
    environment.systemPackages = with pkgs; [
      popcorntime
      vlc
    ];
  };
}
