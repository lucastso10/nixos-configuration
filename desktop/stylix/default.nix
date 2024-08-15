{ pkgs, ... }:
{
  config = {
    stylix = {
      enable = true;

      base16Scheme = {
        base00 = "161616";
        base01 = "262626";
        base02 = "393939";
        base03 = "525252";
        base04 = "dde1e6";
        base05 = "f2f4f8";
        base06 = "ffffff";
        base07 = "08bdba";
        base08 = "3ddbd9";
        base09 = "78a9ff";
        base0A = "42be65";
        base0B = "33b1ff";
        base0C = "ff7eb6";
        base0D = "ee5396";
        base0E = "be95ff";
        base0F = "82cfff";
      };

      image = ../../wallpaper.jpg;

      fonts = {
        monospace = {
          package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
          name = "Hack Nerdfont Mono";
        };
      };

      cursor = {
        package = pkgs.posy-cursors;
        name = "Posy_Cursor_Black";
      };

      polarity = "dark";
    };
  };
}
