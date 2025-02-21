{
  lib,
  config,
  pkgs,
  ...
}:
{

  config = lib.mkIf config.desktop.hyprland.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --cmd Hyprland";
          user = "bolofofo";
        };
      };
    };
  };
}
