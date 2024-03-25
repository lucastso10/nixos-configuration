{ lib, config, pkgs, home-manager, ... }: {

  config = lib.mkIf config.desktop.shell.enable {

    home-manager.users."bolofofo" = { pkgs, ... }: {
      programs.bash.enable = true;

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = let
          # this is the best way I found to do line breaks in the format
          colorA = config.colorScheme.palette.base0D;
          colorB = config.colorScheme.palette.base0E;
          colorC = config.colorScheme.palette.base0B;
          colorD = config.colorScheme.palette.base0C;
          colorE = config.colorScheme.palette.base08;

          format_list = [
            "[](#${colorA})"
            "[ ]"
            "(bg:#${colorA})"
            "$username"
            "[](bg:#${colorB} fg:#${colorA})"
            "$directory"
            "[](fg:#${colorB} bg:#${colorC})"
            "$git_branch$git_status"
            "[](fg:#${colorC} bg:#${colorD})"
            "$nix_shell$docker_context"
            "[](fg:#${colorD} bg:#${colorE})"
            "[ ](fg:#${colorE})"
          ];

          format = lib.strings.concatStrings format_list;
        in {
          inherit format;

          directory = {
            style = "bg:#${colorB}";
            format = "[ $path ]($style)";
            truncation_length = 3;
            truncation_symbol = "…/";
          };

          git_branch = {
            symbol = "";
            style = "bg:#${colorC}";
            format = "[ $symbol $branch ]($style)";
          };

          git_status = {
            style = "bg:#${colorC}";
            format = "[$all_status$ahead_behind ]($style)";
          };

          docker_context = {
            symbol = "  ";
            style = "bg:#${colorD}";
            format = "[ $symbol $context ]($style) $path";
          };

          nix_shell = {
            disabled = false;
            symbol = " ";
            style = "bg:#${colorD}";
            format = "[ $symbol$name ]($style)";
          };

        };
      };
    };
  };
}
