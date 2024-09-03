{
  lib,
  config,
  pkgs,
  outputs,
  ...
}:

{
  options = with lib; {
    desktop.kde.enable = mkEnableOption "kde";
  };

  config = lib.mkIf config.desktop.kde.enable {
    services.xserver.enable = true;
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    services.desktopManager.plasma6.enable = true;
  };
}
