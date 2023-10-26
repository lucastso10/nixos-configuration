{ config, lib, pkgs, inputs, ...}:

{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  options = {
    vim = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          whether or not to enable vim
        '';
      };
    };
  };

  config = lib.mkIf config.vim.enable {
    programs.nixvim = {
      enable = true;
      vimAlias = true;

      options = {
        relativenumber = true;
        shiftwidth = 2;
      };


      colorschemes.tokyonight.enable = true;

      plugins = {
        nix.enable = true;
        lightline.enable = true;
        treesitter.enable = true;
        treesitter-context.enable = true;
        trouble.enable = true;
        nvim-cmp.enable = true;
        neo-tree.enable = true;
      };

      extraPlugins = with pkgs.vimPlugins; [
        vim-be-good
      ];
    };
  };
}
