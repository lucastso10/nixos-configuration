{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.shell.enable {

    home-manager.users."bolofofo" = { pkgs, ... }: {
      programs.bash.enable = true;

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = let
          # this is the best way I found to do line breaks in the format
          format_list = [
            "[](#${config.colorScheme.palette.base0A})"
            "[ ]"
            "(bg:#${config.colorScheme.palette.base0A})"
            "$username"
            "[](bg:#${config.colorScheme.palette.base0C} fg:#${config.colorScheme.palette.base0A})"
            "$directory"
            "[](fg:#${config.colorScheme.palette.base0C} bg:#${config.colorScheme.palette.base0B})"
            "$git_branch$git_status"
            "[](fg:#${config.colorScheme.palette.base0B} bg:#${config.colorScheme.palette.base08})"
            "$nix_shell$docker_context"
            "[](fg:#${config.colorScheme.palette.base08} bg:#${config.colorScheme.palette.base0F})"
            "[ ](fg:#${config.colorScheme.palette.base0F})"
          ];

          format = lib.strings.concatStrings format_list;
        in {
          inherit format;

          directory = {
            style = "bg:#${config.colorScheme.palette.base0C}";
            format = "[ $path ]($style)";
            truncation_length = 3;
            truncation_symbol = "…/";
          };

          git_branch = {
            symbol = "";
            style = "bg:#${config.colorScheme.palette.base0B}";
            format = "[ $symbol $branch ]($style)";
          };

          git_status = {
            style = "bg:#${config.colorScheme.palette.base0B}";
            format = "[$all_status$ahead_behind ]($style)";
          };

          docker_context = {
            symbol = "  ";
            style = "bg:#${config.colorScheme.palette.base08}";
            format = "[ $symbol $context ]($style) $path";
          };

          nix_shell = {
            disabled = false;
            symbol = " ";
            style = "bg:#${config.colorScheme.palette.base08}";
            format = "[ $symbol$name ]($style)";
          };

        };
      };
    };
  };
}
