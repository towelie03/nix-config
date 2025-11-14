{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      updatetime = 100; # Faster completion
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;
      wrap = false;
      #termguicolors = true;
      ignorecase = true;
      incsearch = true;
      smartcase = true;
      confirm = true;
      #clipboard = "unnamedplus";
      cursorline = true;
      list = true;
      signcolumn = "yes";

      completeopt = "menu,menuone,noselect";
      wildmode = "longest:full,full"; # Configures command-line completion (:e <TAB>): longest:full,full → First completes the longest common string, then shows all matches.
      
      swapfile = false;
      undofile = true;
      undolevels = 10000;
    };

    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;

      nvim-tree = {
        enable = true;
        settings = {
          disable_netrw = true;
          hijack_netrw = true;

          update_focused_file.enable = true;

          view = {
            width = 30;
            side = "left";
          };

          renderer = {
            highlight_git = true;
            icons = {
              show = {
                file = true;
                folder = true;
              };
            };
          };
        };
      };

      telescope.enable = true;

      treesitter = {
        enable = true;
        indent = true;
        highlight = { enable = true; };
        settings.ensure_installed = [ "python" "c" "cpp" "go" "lua" "bash" "json" "yaml" "nix" ];
      };

      nvim-autopairs.enable = {
          enable = true;
          settings = {
            disable_filetype = [
              "TelescopePrompt"
            ];

            fast_wrap = {
              end_key = "$";
              map = "<M-e>";
            };
        };
      };

      presence = {
        enable = true;
        settings = {
          enable_line_number = true;
          auto_update = true;
        };
      };

      lsp = {
        enable = true;
        servers = {
          nil_ls = {
            enable = true;
            settings.formatting.command = [ "nixpkgs-fmt" ];
          };
          pyright = {
            enable = true;
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "basic"; 
                  autoSearchPaths = true;
                  useLibraryCodeForTypes = true;
                  diagnosticMode = "workspace";
                  autoImportCompletions = true;
                };
              };
            };
          };          
          gopls.enable = true;
          jdtls.enable = true;
          clangd.enable = true;
          ts_ls.enable = true;
          lua_ls.enable = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<C-n>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
            { name = "luasnip"; }
          ];
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            python = [ "black" ];
            go = [ "gofmt" ];
            java = [ "google-java-format" ];
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            nix = [ "nixpkgs-fmt" ];
          };
        };
      };
      
      smear-cursor = {
        enable = true;
        settings = {
          distance_stop_animating = 0.5;
          hide_target_hack = false;
          stiffness = 0.8;
          trailing_stiffness = 0.5;        
        };
      };
      
      neoscroll = {
        enable = true;
        settings = {
          cursor_scrolls_alone = true;
          easing_function = "quadratic";
          hide_cursor = true;
          mappings = [
            "<C-u>"
            "<C-d>"
            "<C-b>"
            "<C-f>"
            "<C-y>"
            "<C-e>"
            "zt"
            "zz"
            "zb"
            "<Up>"
            "<Down>"
            "<Left>"
            "<Right>"
          ];
          respect_scrolloff = false;
          stop_eof = true;       
        };
      };
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find files";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Live grep";
      }
      {
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
        options.desc = "Toggle NvimTree";
      }
      {
        key = "<C-w>";
        action = "<cmd>NvimTreeFindFile<cr>";
        options.desc = "Find current file in explorer";
      }
      
    ];
  };
}

