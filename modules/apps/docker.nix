{
  ...
}:
{
  flake.modules.nixos.docker =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        docker-compose
      ];

      virtualisation.docker.enable = true;

      users.users."bolofofo".extraGroups = [ "docker" ];
    };
}
