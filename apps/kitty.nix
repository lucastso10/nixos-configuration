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
        theme = "Alucard";
      };

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
          add_newline = false;
          format = lib.concatStrings [
            "$line_break"
            "$package"
            "$line_break"
            "$character"
          ];
          scan_timeout = 10;
          character = {
            success_symbol = "➜";
            error_symbol = "➜";
          }; 
        };
      };
    };
    
  };
}
