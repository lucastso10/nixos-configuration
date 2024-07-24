{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.hyprland.enable {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command =
            "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --cmd Hyprland";
          user = "bolofofo";
        };
        default_session = initial_session;
      };
    };
  };
}
