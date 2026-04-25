{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.desktop.hyprland.enable {
    #environment.systemPackages = [
    #  inputs.caelestia-shell.packages.x86_64-linux.default
    #  inputs.caelestia-cli.packages.x86_64-linux.default
    #];

    home-manager.users."bolofofo".programs.caelestia = {
      enable = true;
      systemd = {
        enable = true; # if you prefer starting from your compositor
        target = "graphical-session.target";
      };
      settings = {
        bar.status = {
          showBattery = false;
          showAudio = true;
          showBluetooth = false;
          showKbLayout = true;
          showMicrophone = true;
          showNetwork = true;
          showWifi = false;
          showLockStatus = false;
        };
        general = {
          idle.timeouts = [ ];
        };
      };
      cli = {
        enable = true; # Also add caelestia-cli to path
        settings = {
        };
      };
    };
  };
}
