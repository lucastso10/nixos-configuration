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

          colors.base00 = "#${config.colors.base16Scheme.base00}";
          colors.base01 = "#${config.colors.base16Scheme.base01}";
          colors.base02 = "#${config.colors.base16Scheme.base02}";
          colors.base03 = "#${config.colors.base16Scheme.base03}";
          colors.base04 = "#${config.colors.base16Scheme.base04}";
          colors.base05 = "#${config.colors.base16Scheme.base05}";
          colors.base06 = "#${config.colors.base16Scheme.base06}";
          colors.base07 = "#${config.colors.base16Scheme.base07}";
          colors.base08 = "#${config.colors.base16Scheme.base08}";
          colors.base09 = "#${config.colors.base16Scheme.base09}";
          colors.base0A = "#${config.colors.base16Scheme.base0A}";
          colors.base0B = "#${config.colors.base16Scheme.base0B}";
          colors.base0C = "#${config.colors.base16Scheme.base0C}";
          colors.base0D = "#${config.colors.base16Scheme.base0D}";
          colors.base0E = "#${config.colors.base16Scheme.base0E}";
          colors.base0F = "#${config.colors.base16Scheme.base0F}";
        };
      };
    in
    {
      environment.systemPackages = [ neovim ];
    };
}
