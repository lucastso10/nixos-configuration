{ lib, config, pkgs, home-manager, ... }: {
  options = with lib; {
    desktop.hyprland.enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        wheter or not to use hyprland as the desktop enviroment
      '';
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
      "$mod" = "ALT";

      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

      bindm = [
        #mouse movements    
        "$mod, ENTER, exec, kitty"

      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        # do I need 10 workspaces? Probably not, but it gives me more power which I like.
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
