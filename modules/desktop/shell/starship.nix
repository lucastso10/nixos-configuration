{ ... }:
{
  flake.modules.homeManager.default =
    {
      lib,
      config,
      ...
    }:
    {
      programs.bash.enable = true;

      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings =
          let
            colorA = config.lib.stylix.colors.base0D;
            colorB = config.lib.stylix.colors.base09;
            colorC = config.lib.stylix.colors.base0A;
            colorD = config.lib.stylix.colors.base0B;
            colorE = config.lib.stylix.colors.base0C;

            # this is the best way I found to do line breaks in the format
            format = lib.strings.concatStrings [
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
          in
          {
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
}
