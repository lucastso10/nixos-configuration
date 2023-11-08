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
          format = "[](#9A348E)$os$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch$git_status[](fg:#FCA17D bg:#86BBD8)$docker_context[](fg:#86BBD8 bg:#33658A)$time[ ](fg:#33658A)";

          os = {
            style = "bg:#9A348E";
            disabled = false;
          };

          username = {
            show_always = true;
            style_user = "bg:#9A348E";
            style_root = "bg:#9A348E";
            format = "[$user ]($style)";
            disabled = true;
          };

          directory = {
            style = "bg:#DA627D";
            format = "[ $path ]($style)";
            truncation_length = 3;
            truncation_symbol = "…/";
          };

          git_branch = { 
            symbol = "";
            style = "bg:#FCA17D";
            format = "[ $symbol $branch ]($style)";
          };
    
          git_status = { 
            style = "bg:#FCA17D";
            format = "[$all_status$ahead_behind ]($style)";
          };

          docker_context = {
            symbol = "  ";
            style = "bg:#06969A";
            format = "[ $symbol $context ]($style) $path";
          };

          time = {
            disabled = false;
            time_format = "%R"; # Hour:Minute Format
            style = "bg:#33658A";
            format = "[ ♥ $time ]($style)";
          };

        };
      };
    };
  };
}
