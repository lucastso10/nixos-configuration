{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.desktop.hyprland.enable {
    environment.systemPackages = [
      inputs.caelestia-shell.packages.x86_64-linux.default
      inputs.caelestia-cli.packages.x86_64-linux.default
      pkgs.gpu-screen-recorder
    ];
  };
}
