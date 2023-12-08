{lib, config, pkgs, home-manager, ...}:

{
  options = with lib; {
    apps.kitty = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          wheter or not to enable the kitty terminal emulator
        '';
      };  
    };
  };

  config = lib.mkIf config.apps.kitty.enable {
    
    home-manager.users."bolofofo" = {
      programs.kitty = {
        enable = true;
        theme = "Alucard";

        font = lib.mkIf config.desktop.nerdfont.enable {
          name = config.desktop.nerdfont.font;
          size = config.desktop.nerdfont.size;
        };
      };
    };
    
  };
}
