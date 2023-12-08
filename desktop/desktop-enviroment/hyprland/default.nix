{lib, config, pkgs, home-manager, ...}:
{
  options = with lib; {
    desktop.hyprland.enable = mkOption { 
      type = types.bool;
      default = true;
      description = ''
        wheter or not to use hyprland as the desktop enviroment
      '';
    };
  };

  config = lib.mkIf config.desktop.hyprland.enable {
    services.xserver.displayManager.gdm.enable = true;

    home-manager.users."bolofofo".wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        decoration = {
          shadow_offset = "0 5";
          "col.shadow" = "rgba(00000099)";
        };

        "$mod" = "ALT";
      };
    };
  };
}
