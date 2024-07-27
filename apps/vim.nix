{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

# TODO: move neovim to seperate flake so I can use it anywhere I want
{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  options = {
    apps.vim = {
      enable = lib.mkEnableOption "vim";
    };
  };

  config = lib.mkIf config.apps.vim.enable {
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      # only true for wayland systems, may want to alter this later
      clipboard.providers.wl-copy.enable = true;

      opts = {
        relativenumber = true;
        shiftwidth = 2;
      };

      colorschemes.base16.enable = true;
      colorschemes.base16.colorscheme = {
        base00 = "#${config.colorScheme.palette.base00}";
        base01 = "#${config.colorScheme.palette.base01}";
        base02 = "#${config.colorScheme.palette.base02}";
        base03 = "#${config.colorScheme.palette.base03}";
        base04 = "#${config.colorScheme.palette.base04}";
        base05 = "#${config.colorScheme.palette.base05}";
        base06 = "#${config.colorScheme.palette.base06}";
        base07 = "#${config.colorScheme.palette.base07}";
        base08 = "#${config.colorScheme.palette.base08}";
        base09 = "#${config.colorScheme.palette.base09}";
        base0A = "#${config.colorScheme.palette.base0A}";
        base0B = "#${config.colorScheme.palette.base0B}";
        base0C = "#${config.colorScheme.palette.base0C}";
        base0D = "#${config.colorScheme.palette.base0D}";
        base0E = "#${config.colorScheme.palette.base0E}";
        base0F = "#${config.colorScheme.palette.base0F}";
      };

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
          key = "<C-f>";
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
            nixd.enable = true; # nix
            pylsp.enable = true; # python
            rust-analyzer = {
              enable = true; # Rust
              installCargo = false;
              installRustc = false;
            };
            html.enable = true;
          };
        };
        cmp-treesitter.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;

        cmp-nvim-ultisnips.enable = true;
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            completion.keywordLength = 2;
            mapping = {
              "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
              "<C-j>" = "cmp.mapping.select_next_item()";
            };
            sources = [
              { name = "ultisnips"; }
              { name = "nvim_lsp"; }
              { name = "path"; }
            ];
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
          # theme = "solarized";
        };

        # color to hex values
        nvim-colorizer.enable = true;

        # tabs
        barbar = {
          enable = true;
          settings.auto_hide = 1;
          keymaps = {
            close = {
              key = "<C-q>";
            };
            next = {
              key = "<C-.>";
            };
            previous = {
              key = "<C-,>";
            };
            moveNext = {
              key = "<C-A-.>";
            };
            movePrevious = {
              key = "<C-A-,>";
            };
          };
        };

        # initial screen
        dashboard.enable = true;

        # undo
        undotree = {
          enable = true;
          #AutoOpenDiff = false;
        };
      };
    };
  };
}
