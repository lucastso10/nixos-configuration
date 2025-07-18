{
  pkgs,
  config,
  ...
}:
{
  config = {
    stylix = {
      enable = true;
      autoEnable = true;

      base16Scheme = {
        base00 = "263238";
        base01 = "2E3C43";
        base02 = "314549";
        base03 = "546E7A";
        base04 = "B2CCD6";
        base05 = "EEFFFF";
        base06 = "EEFFFF";
        base07 = "FFFFFF";
        base08 = "F07178";
        base09 = "F78C6C";
        base0A = "FFCB6B";
        base0B = "C3E88D";
        base0C = "89DDFF";
        base0D = "82AAFF";
        base0E = "C792EA";
        base0F = "FF5370";
      };

      #base16Scheme = {
      #  base00 = "1d2021"; # ----
      #  base01 = "383c3e"; # ---
      #  base02 = "53585b"; # --
      #  base03 = "6f7579"; # -
      #  base04 = "cdcdcd"; # +
      #  base05 = "d5d5d5"; # ++
      #  base06 = "dddddd"; # +++
      #  base07 = "e5e5e5"; # ++++
      #  base08 = "d72638"; # red
      #  base09 = "eb8413"; # orange
      #  base0A = "f19d1a"; # yellow
      #  base0B = "88b92d"; # green
      #  base0C = "1ba595"; # aqua/cyan
      #  base0D = "1e8bac"; # blue
      #  base0E = "be4264"; # purple
      #  base0F = "c85e0d"; # brown
      #};

      # oxocarbon dark
      #base16Scheme = {
      #  base00 = "161616";
      #  base01 = "262626";
      #  base02 = "393939";
      #  base03 = "525252";
      #  base04 = "dde1e6";
      #  base05 = "f2f4f8";
      #  base06 = "ffffff";
      #  base07 = "08bdba";
      #  base08 = "3ddbd9";
      #  base09 = "78a9ff";
      #  base0A = "42be65";
      #  base0B = "33b1ff";
      #  base0C = "ff7eb6";
      #  base0D = "ee5396";
      #  base0E = "be95ff";
      #  base0F = "82cfff";
      #};

      image = ../../wallpaper.png;

      fonts = {
        sizes = {
          terminal = 14;
          applications = 13;
          popups = 13;
        };

        monospace = {
          package = config.desktop.nerdfont.font;
          name = config.desktop.nerdfont.font.name;
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = pkgs.noto-fonts-emoji.name;
        };
      };

      cursor = {
        package = pkgs.posy-cursors;
        name = "Posy_Cursor_Black";
        size = 2;
      };

      polarity = "dark";
    };
  };
}
