{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.qmk.enable = mkEnableOption "qmk";
  };

  config = lib.mkIf config.apps.qmk.enable {
    hardware.keyboard.qmk.enable = true;

    environment.systemPackages = with pkgs; [
      qmk
    ];
  };
}
