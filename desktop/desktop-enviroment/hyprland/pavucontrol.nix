{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.desktop.hyprland.enable {
    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
