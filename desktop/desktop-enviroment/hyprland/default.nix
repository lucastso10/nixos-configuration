{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = with lib; {
    desktop.hyprland = {
      enable = mkEnableOption "hyprland";

      modKey = mkOption {
        type = types.str;
        default = "SUPER";
        description = ''
          alters the mod key used in hyprland
        '';
      };

      monitors = mkOption {
        type = types.listOf types.str;
        default = [ ];
        description = ''
          monitor configuration for setup
          (monitor,resolution@hertz,position,scale
          example: HDMI-A-1, 2560x1080@60, 0x0, 1)
        '';
      };
    };
  };

  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland.enable = true;
    home-manager.users."bolofofo".wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;

      settings = {
        "$mod" = config.desktop.hyprland.modKey;

        exec-once = [
          "${pkgs.waybar}/bin/waybar"
          "hyprpaper"
        ];

        input = {
          kb_layout = "br";
        };

        monitor = config.desktop.hyprland.monitors;

        bind = [
          "$mod, F, exec, firefox"
          "$mod, RETURN, exec, ghostty"
          "$mod, Q, killactive,"
          "$mod, E, exec, rofi -show run -matching fuzzy"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          )
        );
      };
    };
  };
}
