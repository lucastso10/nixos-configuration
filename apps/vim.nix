{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# Neovim config is on a seperate flake https://github.com/lucastso10/Neovim
{
  options = {
    apps.vim = {
      enable = lib.mkEnableOption "vim";
    };
  };

  config =
    let
      neovim = inputs.neovim.packages.x86_64-linux.mkNeovim {
        module = {

          colors.base00 = "#${config.stylix.base16Scheme.base00}";
          colors.base01 = "#${config.stylix.base16Scheme.base01}";
          colors.base02 = "#${config.stylix.base16Scheme.base02}";
          colors.base03 = "#${config.stylix.base16Scheme.base03}";
          colors.base04 = "#${config.stylix.base16Scheme.base04}";
          colors.base05 = "#${config.stylix.base16Scheme.base05}";
          colors.base06 = "#${config.stylix.base16Scheme.base06}";
          colors.base07 = "#${config.stylix.base16Scheme.base07}";
          colors.base08 = "#${config.stylix.base16Scheme.base08}";
          colors.base09 = "#${config.stylix.base16Scheme.base09}";
          colors.base0A = "#${config.stylix.base16Scheme.base0A}";
          colors.base0B = "#${config.stylix.base16Scheme.base0B}";
          colors.base0C = "#${config.stylix.base16Scheme.base0C}";
          colors.base0D = "#${config.stylix.base16Scheme.base0D}";
          colors.base0E = "#${config.stylix.base16Scheme.base0E}";
          colors.base0F = "#${config.stylix.base16Scheme.base0F}";
        };
      };
    in
    lib.mkIf config.apps.vim.enable {
      environment.systemPackages = [ neovim ];

    };
}
