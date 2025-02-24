{
  lib,
  config,
  ...
}:
{

  config = lib.mkIf config.desktop.hyprland.enable {

    home-manager.users."bolofofo".programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          margin-top = 5;
          reload_style_on_change = true;
          modules-left = [
            "custom/notification"
            "custom/pacman"
            "hyprland/window"
            "pulseaudio"
            "cpu"
            "memory"
            "tray"
          ];
          modules-center = ["hyprland/workspaces"];
          modules-right = [
            "group/expand"
            "network"
            "clock"
          ];

          "hyprland/workspaces" = {
            "format" = "{icon}";
            "format-icons" = {
                "active" = "";
                "default" = "";
                "empty" = "";
            };
            "persistent-workspaces" = {
              "*" = [ 
                1 
                2
                3
                4
                5 
                6
                7
                8
                9
                10
              ];
            };
          };
        };
      };
      style = ''
        #workspaces {
            padding: 0px 5px;
        }
        #workspaces button {
            all:unset;
            padding: 0px 5px;
            color: alpha(${"#" + config.stylix.base16Scheme.base07},.4);
            transition: all .2s ease;
        }
        #workspaces button:hover {
            color:rgba(0,0,0,0);
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
        }
        #workspaces button.active {
            color: ${"#" + config.stylix.base16Scheme.base07};
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
        }
        #workspaces button.empty {
            color: rgba(0,0,0,0);
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
        }
        #workspaces button.empty:hover {
            color: rgba(0,0,0,0);
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
        }
        #workspaces button.empty.active {
            color: ${"#" + config.stylix.base16Scheme.base07};
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
        }
      '';
    };
  };
}
