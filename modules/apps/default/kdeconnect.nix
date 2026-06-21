{
  ...
}:
{
  flake.modules.homeManager.default =
    { ... }:
    {
      programs.kdeconnect = { 
        enable = true;
      };
    };
}
