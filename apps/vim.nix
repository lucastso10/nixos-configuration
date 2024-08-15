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

      clipboard.providers.wl-copy.enable = true;

      globals.mapleader = " ";

      opts = {
        relativenumber = true;
        shiftwidth = 2;
      };

      #colorschemes.base16.enable = true;
      #colorschemes.base16.colorscheme = {
      #  base00 = "#${config.colorScheme.palette.base00}";
      #  base01 = "#${config.colorScheme.palette.base01}";
      #  base02 = "#${config.colorScheme.palette.base02}";
      #  base03 = "#${config.colorScheme.palette.base03}";
      #  base04 = "#${config.colorScheme.palette.base04}";
      #  base05 = "#${config.colorScheme.palette.base05}";
      #  base06 = "#${config.colorScheme.palette.base06}";
      #  base07 = "#${config.colorScheme.palette.base07}";
      #  base08 = "#${config.colorScheme.palette.base08}";
      #  base09 = "#${config.colorScheme.palette.base09}";
      #  base0A = "#${config.colorScheme.palette.base0A}";
      #  base0B = "#${config.colorScheme.palette.base0B}";
      #  base0C = "#${config.colorScheme.palette.base0C}";
      #  base0D = "#${config.colorScheme.palette.base0D}";
      #  base0E = "#${config.colorScheme.palette.base0E}";
      #  base0F = "#${config.colorScheme.palette.base0F}";
      #};

      keymaps = [
        {
          mode = "n";
          key = "<leader>ff";
          action = "<cmd>:Telescope find_files<cr>";
        }
        {
          mode = "n";
          key = "<C-t>";
          action = "<Cmd>exe v:count1 . 'ToggleTerm'<CR>";
        }
        {
          mode = "t";
          key = "<C-t>";
          action = "<Esc><Cmd>exe v:count1 . 'ToggleTerm'<CR>";
        }
        # nvim-tree keymaps
        {
          mode = "n";
          key = "<leader>n";
          action = "<cmd>:NvimTreeToggle<cr>";
          options = {
            silent = true;
            desc = "Toggle Tree";
          };
        }
        # undotree keymaps
        {
          mode = "n";
          key = "<leader>u";
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
        nix-develop.enable = true;
        treesitter.enable = true;

        # trying to do autocomplete kind of works, but gives error sometimes
        lsp = {
          enable = true;
          servers = {
            ccls.enable = true; # C/C++
            cmake.enable = true; # cmake
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
        cmp-nvim-ultisnips.enable = true;
        cmp-nvim-lsp.enable = true;

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
        neo-tree = {
          enable = true;
          enableGitStatus = true;
          enableModifiedMarkers = true;

          extraOptions = {
            filesystem = {
              hide_dotfiles = true;
              hide_gitignored = true;
              always_show = [ ".gitignored" ];
            };
            git_status = {
              symbols = {
                untracked = "";
                ignored = "";
                unstaged = "󰄱";
                staged = "";
                conflict = "";
              };
            };
          };

        };

        # bottom bar
        airline = {
          enable = false;
          # powerline = true;
          # theme = "solarized";
        };

        # color to hex values
        nvim-colorizer.enable = true;

        # initial screen
        dashboard = {
          enable = true;
          settings = {
            config = {
              footer = [ "Powered by nixvim!" ];
              header = [
                "            ,----------------,               ,---------, "
                "        ,-----------------------,          ,'        ,'|"
                "      ,'                      ,'|        ,'        ,'  |"
                "     +-----------------------+  |      ,'        ,'    |"
                "     |  .-----------------.  |  |     +---------+      |"
                "     |  |                 |  |  |     | -==----'|      |"
                "     |  |  I LOVE VIM!..  |  |  |     |         |      |"
                "     |  |  How do I exit  |  |  |/----|`---=    |      |"
                "     |  |  again?_        |  |  |   ,/|==== ooo |      ;"
                "     |  |                 |  |  |  // |(((( [33]|    ,' "
                "     |  `-----------------'  |,' .;'| |((((     |  ,,   "
                "     +-----------------------+  ;;  | |         |,'     "
                "        /_)______________(_/  //'   | +---------+       "
                "   ___________________________/___  `,                  "
                "  /  oooooooooooooooo  .o.  oooo /,   \,'-----------    "
                " / ==ooooooooooooooo==.o.  ooo= //   ,`\--{)B     ,'    "
                "/_==__==========__==_ooo__ooo=_/'   /___________,'      "
                "                                                        "
              ];
              mru = {
                limit = 20;
              };
              project = {
                enable = true;
                action = "NvimTreeOpen cwd=";
              };
              packages.enable = false;
            };
            theme = "hyper";
          };
        };

        telescope.enable = true;
        # undo
        undotree = {
          enable = true;
          #AutoOpenDiff = false;
        };

        toggleterm = {
          enable = true;
          settings = {
            direction = "float";
            float_opts = {
              border = "curved";
              title_pos = "center";
            };
          };
        };

        neoscroll.enable = true;
      };
    };
  };
}
