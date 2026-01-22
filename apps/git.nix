{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}:
{
  config = {
    home-manager.users."bolofofo" = {
      programs.git = {
        enable = true;
        settings.user.name = "lucastso10";
        settings.user.email = "lucastso10@gmail.com";
      };
    };
  };
}
