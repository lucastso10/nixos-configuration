{
  ...
}:
{
  flake.modules.nixos.default =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs.kdePackages; [
        dolphin
        dolphin-plugins
        ark
      ];
    };
}
