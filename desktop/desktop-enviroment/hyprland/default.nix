{ lib, config, pkgs, home-manager, ... }: {
  options = with lib; {
    desktop.hyprland = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to use hyprland as the desktop enviroment
        '';
      };

      modKey = mkOption {
        type = types.str;
        default = "ALT";
        description = ''
          alters the mod key used in hyprland
        '';
      };
    };
  };

  config = lib.mkIf config.desktop.hyprland.enable {
    # I need to find a better displaymanager for this, 
    # I don't want any gnome when I have hyprland active
    services.xserver.displayManager.gdm.enable = true;

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

      bind = [
        "$mod, F, exec, firefox"
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
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
