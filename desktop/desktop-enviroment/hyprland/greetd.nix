{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.hyprland.enable {
    environment.systemPackages = with pkgs; [ greetd.tuigreet ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = { command = "$(pkgs.hyprland)/bin/hyprland"; };
      };
    };
  };
}
