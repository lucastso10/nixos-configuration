{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.vr.enable = mkEnableOption "vr setup";
  };

  config = lib.mkIf config.apps.vr.enable {
    environment.systemPackages = with pkgs; [
      sidequest
    ];
  };
}
