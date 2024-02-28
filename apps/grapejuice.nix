{ pkgs, lib, config, ... }:
# I'm not proud of this
# TODO: this still doesn't work!
{
  options = with lib; {
    apps.roblox.enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        wheter or not to install roblox on the system
      '';
    };
  };

  config = lib.mkIf config.apps.roblox.enable {
    environment.systemPackages = with pkgs; [ grapejuice ];
    # For wine32 bit
    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;
  };
}
