{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.docker.enable = mkEnableOption "docker";
  };

  config = lib.mkIf config.apps.docker.enable {
    virtualisation.docker.enable = true;

    users.users."bolofofo".extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
