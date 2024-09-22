{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.prism.enable = mkEnableOption "prismlauncher";
  };

  config = lib.mkIf config.apps.prism.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];
  };
}
