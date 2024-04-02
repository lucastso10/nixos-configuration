{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.waybar = {
      enable = true;
      systemd.enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          margin-top = 5;

          modules-left = [
            "custom/startmenu"
            "hyprland/window"
            "pulseaudio"
            "cpu"
            "memory"
          ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [
            "custom/hyprbindings"
            "custom/exit"
            "idle_inhibitor"
            "custom/notification"
            "clock"
            "tray"
          ];

        };
      };
    };
  };
}
