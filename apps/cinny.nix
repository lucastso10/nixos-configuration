{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.cinny.enable = mkEnableOption "cinny";
  };

  config = lib.mkIf config.apps.cinny.enable {
    environment.systemPackages = with pkgs; [
      cinny-desktop
    ];
  };
}
