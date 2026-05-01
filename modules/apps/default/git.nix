{
  ...
}:
{
  flake.modules.homeManager.default =
    { ... }:
    {
      programs.git = {
        enable = true;
        settings.user.name = "lucastso10";
        settings.user.email = "lucastso10@gmail.com";
      };
    };
}
