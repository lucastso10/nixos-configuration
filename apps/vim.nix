{ config, lib, pkgs, inputs, ...}:

{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  options = {
    apps.vim = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false; 
        description = ''
          whether or not to enable vim
        '';
      };
    };
  };

  config = lib.mkIf config.apps.vim.enable {
    programs.nixvim = {
      enable = true;
      vimAlias = true;

      clipboard.providers.wl-copy.enable = true; # only true for wayland systems, may want to alter this later

      options = {
        relativenumber = true;
        shiftwidth = 2;
      };


      colorschemes.tokyonight.enable = true;

      plugins = {
        # highlighting stuff
        nix.enable = true;
        treesitter.enable = true;
        treesitter-context.enable = true;

        # trying to do autocomplete NOT WORKING
        lsp = {
          enable = true;
          servers = {
            clangd.enable = true; # C/C++
            cmake.enable = true; # cmake
            digestif.enable = true; # LaTex
            nixd.enable = true; # nix
            pylsp.enable = true; # python
          };
        };
        cmp-treesitter.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;
        nvim-cmp = {
          enable = true;
        };

        # browse through files
        neo-tree.enable = true;

        # button bar
        airline = {
          enable = true;
          powerline = true;
          theme = null;
        };

        # tabs
        bufferline = {
          enable = true;
          diagnostics = "nvim_lsp";
        };
      };

      extraPlugins = with pkgs.vimPlugins; [
        vim-be-good
      ];
    };
  };
}
