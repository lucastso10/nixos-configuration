{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.prism = {
      enable = mkEnableOption "prism";
    };
  };

  config = lib.mkIf config.apps.prism.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];
  };
}
