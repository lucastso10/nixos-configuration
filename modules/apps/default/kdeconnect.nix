{
  ...
}:
{
  flake.modules.nixos.default =
    { ... }:
    {
      programs.kdeconnect = {
        enable = true;
      };
    };
}
