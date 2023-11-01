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
    
    home-manager.users."bolofofo" = { pkgs, ... }:{
      programs.kitty = {
        enable = true;
        theme = "Batman";
      };
    };
    
  };
}
