{lib, config, pkgs, home-manager, ...}:
{
  options = with lib; {
    desktop.shell = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          wheter or not to enable custmo shell
        '';
      };
    };
  };

  config = lib.mkIf config.desktop.shell.enable {
    
    home-manager.users."bolofofo" = { pkgs, ... }:{
      programs.bash.enable = true;

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {

        };
      };
    };
  };
}
