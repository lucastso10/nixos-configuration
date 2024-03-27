{ lib, config, pkgs, home-manager, ... }: {
  imports = [ ./greetd.nix ./rofi.nix ./waybar.nix ];

  options = with lib; {
    desktop.hyprland = {
      enable = mkEnableOption "hyprland";

      modKey = mkOption {
        type = types.str;
        default = "ALT";
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
    programs.hyprland.xwayland.enable = true;
    home-manager.users."bolofofo".wayland.windowManager.hyprland.enable = true;

    home-manager.users."bolofofo".wayland.windowManager.hyprland.settings = {
      "$mod" = config.desktop.hyprland.modKey;

      decoration = {
        # shadow stuff
        drop_shadow = true;
        shadow_offset = "5 5";
        "col.shadow" = "rgba(00000099)";
      };

      input = { kb_layout = "br"; };

      monitor = config.desktop.hyprland.monitors;

      bind = [
        "$mod, F, exec, firefox"
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive,"
        "$mod, E, exec, rofi -show run"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));
    };
  };
}
