{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.clickup.enable = mkEnableOption "clickup";
  };

  config = lib.mkIf config.apps.clickup.enable {
    environment.systemPackages = with pkgs; [
      clickup
    ];
  };
}
