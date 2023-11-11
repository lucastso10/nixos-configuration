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

        # trying to do autocomplete NOT WORKING
        lsp = {
          enable = true;
          servers = {
            ccls.enable = true; # C/C++
            cmake.enable = true; # cmake
            digestif.enable = true; # LaTex
            nixd = {
              enable = true; # nix
              settings.formatting.command = "${pkgs.alejandra}/bin/alejandra";
            };
            pylsp.enable = true; # python
          };
        };
        cmp-treesitter.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;

        luasnip.enable = true;
        nvim-cmp = {
          enable = true;
          sources = [
            {
              name = "luasnip";
              option.show_autosnippets = true;
              priority = 3;
            }
            {
              name = "nvim_lsp";
              priority = 2;
            }
            {
              name = "path";
              priority = 1;
            }
          ];

          mapping = {
            "<Tab>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
            "<C-Space>" = "cmp.mapping.scroll_docs(1)";
          };
        };

        # browse through files
        neo-tree.enable = true;

        # bottom bar
        airline = {
          enable = true;
          powerline = true;
          theme = "solarized"; 
        };

        # color to hex values
        nvim-colorizer.enable = true;

        # tabs
        #bufferline = {
          #enable = true;
          #alwaysShowBufferline = true;
          #highlights.indicatorSelected.sp = "#8aadf4";
          #indicator.style = "underline";
          #diagnostics = "nvim_lsp";
          #hover.enabled = true;
        #};
      };
    };
  };
}
