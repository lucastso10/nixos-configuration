{
  ...
}:
{
  flake.modules.nixos.default =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        docker-compose
      ];

      virtualisation.docker.enable = true;

      users.users."bolofofo".extraGroups = [ "docker" ];
    };
}
