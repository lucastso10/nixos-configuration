{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          heigth = 30;

          modules-center = [ "hyprland/workspaces" ];
          modules-left = [
            "custom/startmenu"
            "hyprland/window"
            "pulseaudio"
            "cpu"
            "memory"
          ];
          modules-right = [
            "custom/hyprbindings"
            "custom/exit"
            "idle_inhibitor"
            "custom/themeselector"
            "custom/notification"
            "battery"
            "clock"
            "tray"
          ];

        };
      };
    };
  };
}
