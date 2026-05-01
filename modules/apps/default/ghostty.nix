{
  ...
}:
{
  flake.modules.homeManager.default =
    { ... }:
    {
      programs.ghostty = {
        enable = true;
      };
    };
}
