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

  config = lib.mkIf config.apps.vim.enable {
    environment.systemPackages = [ inputs.neovim.packages.x86_64-linux.default ];
  };
}
