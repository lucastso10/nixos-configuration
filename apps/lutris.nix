{pkgs, lib, config, ...}:
{
  options = with lib; {
    apps.lutris = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to install lutris on the system
        '';
      };
    };
  };

  config = lib.mkIf config.apps.lutris.enable {
    environment.systemPackages = with pkgs; [
      lutris
      wine
      winetricks
    ];
  };
}
