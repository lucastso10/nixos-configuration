{ ... }:
{
  flake.modules.homeManager.hyprland =
    { ... }:
    {
      programs.caelestia = {
        enable = true;
        systemd = {
          enable = true; # if you prefer starting from your compositor
          target = "graphical-session.target";
        };
        settings = {
          appearance = {
            transparency = {
              enabled = true;
              base = 0.75;
            };
          };
          general = {
            idle.timeouts = [ ];
          };
          bar = {
            clock = {
              showDate = true;
            };
            status = {
              showBattery = false;
              showAudio = true;
              showBluetooth = false;
              showKbLayout = true;
              showMicrophone = true;
              showNetwork = true;
              showWifi = false;
              showLockStatus = false;
            };
          };
        };
        cli = {
          enable = true; # Also add caelestia-cli to path
        };
      };
    };
}
