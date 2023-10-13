{ config, lib, pkgs, inputs, ...}:

{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;

    options = {
      relativenumber = true;
      shiftwidth = 2;
    };


    colorschemes.tokyonight.enable = true;
    
    plugins.lightline.enable = true;
    plugins.nix.enable = true;
    plugins.treesitter.enable = true;
    plugins.treesitter-context.enable = true;
    plugins.trouble.enable = true;
    plugins.cmp-git.enable = true;
  };
}
