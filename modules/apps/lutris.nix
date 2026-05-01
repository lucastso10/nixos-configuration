{
  ...
}:
{
  flake.modules.nixos.games =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        lutris
        wine
        winetricks
      ];
    };
}
