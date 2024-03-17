{ pkgs, lib, config, ... }:
# I'm not proud of this
# TODO: this still doesn't work!
{
  options = with lib; {
    apps.roblox.enable = mkEnableOption "roblox";
  };

  config = lib.mkIf config.apps.roblox.enable {
    environment.systemPackages = with pkgs; [ grapejuice ];
    # For wine32 bit
    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;
  };
}
