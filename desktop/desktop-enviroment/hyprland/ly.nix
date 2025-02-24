{
  lib,
  config,
  ...
}:
{

  config = lib.mkIf config.desktop.hyprland.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animate = true;
        animation = 0;
      };
    };
  };
}
