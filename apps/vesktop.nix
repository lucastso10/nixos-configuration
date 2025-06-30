
{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.vesktop = {
      enable = mkEnableOption "vesktop";
    };
  };

  config = lib.mkIf config.apps.vesktop.enable {
    environment.systemPackages = with pkgs; [
      vesktop
    ];
  };
}
