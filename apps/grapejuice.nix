{pkgs, lib, config, ...}:
# I'm not pround of this
{
  options = with lib; {
    apps.roblox = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to install roblox on the system
        '';
      };
    };
  };

  config = lib.mkIf config.apps.lutris.enable {
    environment.systemPackages = with pkgs; [
      grapejuice
    ];
  };
}
