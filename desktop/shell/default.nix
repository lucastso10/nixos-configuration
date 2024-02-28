{ lib, config, pkgs, home-manager, ... }: {
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

    home-manager.users."bolofofo" = { pkgs, ... }: {
      programs.bash.enable = true;

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
          format =
            "[](#9A348E)[ ](bg:#9A348E)$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch$git_status[](fg:#FCA17D bg:#06969A)$nix_shell$docker_context[](fg:#06969A bg:#33658A)[ ](fg:#33658A)";

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

          nix_shell = {
            disabled = false;
            symbol = " ";
            style = "bg:#06969A";
            format = "[ $symbol$name ]($style)";
          };

          time = {
            disabled = true;
            time_format = "%R"; # Hour:Minute Format
            style = "bg:#33658A";
            format = "[ ♥ $time ]($style)";
          };

        };
      };
    };
  };
}
