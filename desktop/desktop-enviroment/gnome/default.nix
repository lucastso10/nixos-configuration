{ lib, config, pkgs, outputs, ...}:

{
  options = with lib; { 
    desktop.gnome.enable = mkOption {
      type = types.bool;
      default = true;
      description = ''
        wheter or not to use gnome as the desktop enviroment
      '';
    };
  };

  config = lib.mkIf config.desktop.gnome.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver = {
      layout = "br";
      xkbVariant = "";
    };
  };
}
