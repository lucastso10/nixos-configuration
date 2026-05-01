{
  ...
}:
{
  flake.modules.nixos.default =
    { ... }:
    {
      services.flatpak.enable = true;
    };
}
