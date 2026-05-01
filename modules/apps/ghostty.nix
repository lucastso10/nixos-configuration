{
  ...
}:
{
  flake.modules.nixos.default =
    { ... }:
    {
      programs.ghostty = {
        enable = true;
      };
    };
}
