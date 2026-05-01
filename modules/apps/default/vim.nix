{
  inputs,
  ...
}:
{
  flake.modules.nixos.default =
    { config, ... }:
    let
      neovim = inputs.neovim.packages.x86_64-linux.mkNeovim {
        module = {

          colors.base00 = "#${config.lib.stylix.colors.base00}";
          colors.base01 = "#${config.lib.stylix.colors.base01}";
          colors.base02 = "#${config.lib.stylix.colors.base02}";
          colors.base03 = "#${config.lib.stylix.colors.base03}";
          colors.base04 = "#${config.lib.stylix.colors.base04}";
          colors.base05 = "#${config.lib.stylix.colors.base05}";
          colors.base06 = "#${config.lib.stylix.colors.base06}";
          colors.base07 = "#${config.lib.stylix.colors.base07}";
          colors.base08 = "#${config.lib.stylix.colors.base08}";
          colors.base09 = "#${config.lib.stylix.colors.base09}";
          colors.base0A = "#${config.lib.stylix.colors.base0A}";
          colors.base0B = "#${config.lib.stylix.colors.base0B}";
          colors.base0C = "#${config.lib.stylix.colors.base0C}";
          colors.base0D = "#${config.lib.stylix.colors.base0D}";
          colors.base0E = "#${config.lib.stylix.colors.base0E}";
          colors.base0F = "#${config.lib.stylix.colors.base0F}";
        };
      };
    in
    {
      environment.systemPackages = [ neovim ];
    };
}
