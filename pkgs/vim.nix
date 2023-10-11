{ config, lib, pkgs, inputs, ...}:

{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;

    options = {
      number = true;
      shiftwidth = 2;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
    ];

    colorschemes.tokyonight.enable = true;
    
    plugins.lightline.enable = true;
  };
}
