{
  ...
}:
{
  flake.modules.nixos.popcorntime =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        popcorntime
        vlc
      ];
    };
}
