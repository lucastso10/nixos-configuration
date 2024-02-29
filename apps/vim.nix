{ config, lib, pkgs, inputs, ... }:

# TODO: move neovim to seperate flake so I can use it anywhere I want
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
      viAlias = true;
      vimAlias = true;

      clipboard.providers.wl-copy.enable =
        true; # only true for wayland systems, may want to alter this later

      options = {
        relativenumber = true;
        shiftwidth = 2;
      };

      colorschemes.tokyonight.enable = true;

      keymaps = [
        # nvim-tree keymaps
        {
          mode = "n";
          key = "<C-n>";
          action = "<cmd>:NvimTreeToggle<cr>";
          options = {
            silent = true;
            desc = "Toggle Tree";
          };
        }
        {
          mode = "n";
          key = "<A-f>";
          action = "<cmd>:NvimTreeFindFile<cr>";
          options = {
            silent = true;
            desc = "CurrentFile";
          };
        }
        # undotree keymaps
        {
          mode = "n";
          key = "<A-F3>";
          action = "<cmd>:UndotreeToggle<cr>";
          options = {
            silent = true;
            desc = "Toggle undotree";
          };
        }
      ];

      plugins = {
        # highlighting stuff
        nix.enable = true;
        treesitter.enable = true;

        # trying to do autocomplete kind of works, but gives error sometimes
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

        cmp-nvim-ultisnips.enable = true;
        nvim-cmp = {
          enable = true;
          completion.keywordLength = 2;
          snippet.expand = "ultisnips";
          sources = [
            {
              name = "ultisnips";
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
            "<CR>" =
              "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
            "<C-j>" = "cmp.mapping.select_next_item()";
          };
        };

        # browse through files
        nvim-tree = {
          enable = true;
          hijackCursor = true;

          filters = {
            dotfiles = true; # ignores files with .
            custom = [ "^.git$" ];
          };

          git = {
            enable = true;
            ignore = true; # makes tree ignore files on gitignore
          };
        };

        # bottom bar
        airline = {
          enable = true;
          # powerline = true;
          theme = "solarized";
        };

        # color to hex values
        nvim-colorizer.enable = true;

        # tabs
        barbar = {
          enable = true;
          autoHide = true;
          keymaps = {
            close = "<C-q>";
            next = "<C-.>";
            previous = "<C-,>";
            moveNext = "<C-A-.>";
            movePrevious = "<C-A-,>";
          };
        };

        # initial screen
        dashboard.enable = true;

        # undo
        undotree = {
          enable = true;
          AutoOpenDiff = false;
        };
      };
    };
  };
}
