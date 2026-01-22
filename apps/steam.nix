{
  lib,
  config,
  pkgs,
  home-manager,
  ...
}:
{
  options = with lib; {
    apps.steam = {
      enable = mkEnableOption "steam";
    };
  };

  config = lib.mkIf config.apps.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    };
    hardware.steam-hardware.enable = true;
  };
}
