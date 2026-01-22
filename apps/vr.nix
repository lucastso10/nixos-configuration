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

    services.monado = {
      enable = true;
      defaultRuntime = true; # Register as default OpenXR runtime
    };

    hardware.steam-hardware.enable = true;
  };
}
