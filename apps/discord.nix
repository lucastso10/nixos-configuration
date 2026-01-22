{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.discord = {
      enable = mkEnableOption "discord";
    };
  };

  config = lib.mkIf config.apps.discord.enable {
    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}
