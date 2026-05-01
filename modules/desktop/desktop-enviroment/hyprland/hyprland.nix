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
      { config, ... }:
      {
        wayland.windowManager.hyprland = {
            enable = true;
            systemd.enable = true;

            settings = {
              "$mod" = config.desktop.hyprland.modKey;

              exec-once = [
                "systemctl --user enable --now caelestia-shell.service"
              ];

              input = {
                kb_layout = "br";
              };

              monitor = config.desktop.hyprland.monitors;

              workspace = config.desktop.hyprland.workspaces;

              bind = [
                "$mod, F, exec, zen"
                "$mod, RETURN, exec, ghostty"
                "$mod, Q, killactive,"
                "$mod, E, global, caelestia:launcher"
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
