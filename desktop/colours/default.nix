{ lib, config, pkgs, inputs, home-manager, ... }: {
  # decided to make this not an option

  imports = [ inputs.nix-colors.homeManagerModules.default ];

  config = {
    colorScheme = {
      name = "quite-not-oxocarbon-dark";
      author = "Bolofofodoidao";
      palette = {
        base00 = "#161616";
        base01 = "#262626";
        base02 = "#393939";
        base03 = "#525252";
        base04 = "#656565";
        base05 = "#dde1e6";
        base06 = "#f2f4f8";
        base07 = "#ffffff";
        base08 = "#3ddbd9";
        base09 = "#78a9ff";
        base0A = "#ee5396";
        base0B = "#33b1ff";
        base0C = "#ff7eb6";
        base0D = "#e03996";
        base0E = "#be95ff";
        base0F = "#82cfff";
      };
    };
  };
}
