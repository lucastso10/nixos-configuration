{ ... }:
{
  flake.modules.nixos.hyprland =
    { lib, ... }:
    {
      options = with lib; {
        desktop.hyprland = {
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

          workspaces = mkOption {
            type = types.listOf types.str;
            default = [ ];
            description = ''
              configuration for workspaces
            '';
          };
        };
      };

      config = {
        programs.hyprland.enable = true;
      };
    };

  flake.modules.homeManager.hyprland =
    { lib, osConfig, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;

        settings = {
          "$mod" = osConfig.desktop.hyprland.modKey;

          exec-once = [
            "systemctl --user enable --now caelestia-shell.service"
          ];

          input = {
            kb_layout = "br";
          };

          monitor = osConfig.desktop.hyprland.monitors;

          workspace = osConfig.desktop.hyprland.workspaces;

          general = {
            layout = "dwindle";
            allow_tearing = false;
            "col.active_border" = lib.mkForce "rgba(c2c1ffe6)";
            "col.inactive_border" = lib.mkForce "rgba(c8c5d111)";
          };

          dwindle = {
            preserve_split = true;
            smart_split = false;
            smart_resizing = true;
          };

          decoration = {
            rounding = 15;

            blur = {
              enabled = true;
              xray = false;
              special = false;
              ignore_opacity = true;
              new_optimizations = true;
              popups = true;
              input_methods = true;
              size = 8;
              passes = 2;
            };

            shadow = {
              enabled = true;
              range = 20;
              render_power = 3;
              color = lib.mkForce "rgba(353434d4)"; # $surfaced4 → $shadow hex is 000000 but $surface = 131317, surfaced4 maps to surface at d4 opacity
            };
          };

          bind = [
            "$mod, F, exec, zen"
            "$mod, RETURN, exec, ghostty"
            "$mod, Q, killactive,"
            "$mod, E, global, caelestia:launcher"
            ", Print, exec, caelestia screenshot -r"
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
