{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = {
    programs.rofi = {
      enable = true;
      location = "center";

      plugins = with pkgs; [
        rofi-systemd
        rofi-screenshot
        rofimoji
      ];

      terminal = "${pkgs.ghostty}/bin/ghostty";

      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
          foreground = mkLiteral "#${config.stylix.base16Scheme.base07}";
          background-color = mkLiteral "#${config.stylix.base16Scheme.base00}";
          active-background = mkLiteral "#${config.stylix.base16Scheme.base0E}";
          urgent-background = mkLiteral "#${config.stylix.base16Scheme.base0F}";
          urgent-foreground = mkLiteral "#${config.stylix.base16Scheme.base02}";
        in
        lib.mkForce {
          # Tweaked Dracula theme

          "configuration" = {
            show-icons = true;
            display-drun = "";
            disable-history = false;
          };

          "*" = {
            #font = "${config.desktop.nerdfont.font.name}";
            foreground = foreground;
            background-color = background-color;
            active-background = active-background;
            urgent-background = urgent-background;
            urgent-foreground = urgent-foreground;
            selected-background = active-background;
            selected-urgent-background = urgent-background;
            selected-active-background = active-background;
            separatorcolor = active-background;
            bordercolor = active-background;
          };

          "#window" = {
            background-color = background-color;
            border = 3;
            border-radius = 6;
            border-color = active-background;
            padding = 15;
          };
          "#mainbox" = {
            border = 0;
            padding = 0;
          };
          "#message" = {
            border = mkLiteral "0px";
            border-color = active-background;
            padding = mkLiteral "1px";
          };
          "#textbox" = {
            text-color = foreground;
          };
          "#listview" = {
            fixed-height = 0;
            border = mkLiteral "0px";
            border-color = active-background;
            spacing = mkLiteral "2px";
            scrollbar = false;
            padding = mkLiteral "2px 0px 0px";
          };
          "#element" = {
            border = 0;
            padding = mkLiteral "3px";
          };
          "#element.normal.normal" = {
            background-color = background-color;
            text-color = foreground;
          };
          "#element.normal.urgent" = {
            background-color = urgent-background;
            text-color = urgent-foreground;
          };
          "#element.normal.active" = {
            background-color = active-background;
            text-color = foreground;
          };
          "#element.selected.normal" = {
            background-color = active-background;
            text-color = foreground;
          };
          "#element.selected.urgent" = {
            background-color = urgent-background;
            text-color = foreground;
          };
          "#element.selected.active" = {
            background-color = active-background;
            text-color = foreground;
          };
          "#element.alternate.normal" = {
            background-color = background-color;
            text-color = foreground;
          };
          "#element.alternate.urgent" = {
            background-color = urgent-background;
            text-color = foreground;
          };
          "#element.alternate.active" = {
            background-color = active-background;
            text-color = foreground;
          };
          "#scrollbar" = {
            width = mkLiteral "2px";
            border = 0;
            handle-width = mkLiteral "8px";
            padding = 0;
          };
          "#sidebar" = {
            border = mkLiteral "2px dash 0px 0px";
            border-color = mkLiteral "@separatorcolor";
          };
          "#button.selected" = {
            background-color = active-background;
            text-color = foreground;
          };
          "#inputbar" = {
            spacing = 0;
            text-color = foreground;
            padding = "1px";
          };
          "#case-indicator" = {
            spacing = 0;
            text-color = foreground;
          };
          "#entry" = {
            spacing = 0;
            text-color = foreground;
          };
          "#prompt" = {
            spacing = 0;
            text-color = foreground;
          };
          "#inputbar" = {
            children = [
              "prompt"
              "textbox-prompt-colon"
              "entry"
              "case-indicator"
            ];
          };
          "#textbox-prompt-colon" = {
            expand = false;
            str = ">";
            margin = mkLiteral "0px 0.3em 0em 0em";
            text-color = foreground;
          };
          "element-text, element-icon" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };
        };

    };
  };
}
