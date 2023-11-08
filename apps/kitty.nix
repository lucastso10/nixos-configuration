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

      programs.bash.enable = true;

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
          add_newline = false;
          format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
          username = {
            style_user = "bright-white bold";
            style_root = "bright-red bold";
          };
          hostname = {
            style = "bright-green bold";
            ssh_only = true;
          };
          nix_shell = {
            symbol = "";
            format = "[$symbol$name]($style) ";
            style = "bright-purple bold";
          };
          git_branch = {
            only_attached = true;
            format = "[$symbol$branch]($style) ";
            symbol = "שׂ";
            style = "bright-yellow bold";
          };
          git_commit = {
            only_detached = true;
            format = "[ﰖ$hash]($style) ";
            style = "bright-yellow bold";
          };
          git_state = {
            style = "bright-purple bold";
          };
          git_status = {
            style = "bright-green bold";
          };
          directory = {
            read_only = " ";
            truncation_length = 0;
          };
          cmd_duration = {
            format = "[$duration]($style) ";
            style = "bright-blue";
          };
          jobs = {
            style = "bright-green bold";
          };
          character = {
            success_symbol = "[\\$](bright-green bold)";
            error_symbol = "[\\$](bright-red bold)";
          };
        };
      };
    };
    
  };
}
