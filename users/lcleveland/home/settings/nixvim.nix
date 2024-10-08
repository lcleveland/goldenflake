{ lib, inputs, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username} = {
      imports = [
        inputs.nixvim.homeManagerModules.nixvim
      ];
      programs.nixvim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        clipboard.providers.wl-copy.enable = true;
        colorschemes.nightfox = {
          enable = true;
          flavor = "carbonfox";
        };
        plugins = {
          codeium-nvim = {
            enable = true;
          };
          cmp = {
            enable = true;
            settings = {
              mapping = {
                "<C-Space>" = "cmp.mapping.complete()";
                "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                "<C-e>" = "cmp.mapping.close()";
                "<C-f>" = "cmp.mapping.scroll_docs(4)";
                "<CR>" = "cmp.mapping.confirm({ select = true })";
                "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              };
              sources = [
                {
                  name = "codeium";
                }
                {
                  name = "nvim_lsp";
                }
              ];
            };
          };
          cmp-nvim-lsp = {
            enable = true;
          };
          noice = {
            enable = true;
            lsp.override = {
              "cmp.entry.get_documentation" = true;
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
            };
            cmdline.view = "cmdline";
            popupmenu = {
              enabled = true;
            };
          };
          notify = {
            enable = true;
          };
          treesitter = {
            enable = true;
            settings = {
              auto_install = true;
              parser_install_dir = "/home/${config.users.lcleveland.username}/.config/nvim/treesitter";
            };
          };
          lsp = {
            enable = true;
            servers = {
              nil-ls = {
                enable = true;
                autostart = true;
              };
              nixd = {
                enable = true;
                autostart = true;
              };
            };
          };
          lsp-format = {
            enable = true;
          };
          lsp-lines = {
            enable = true;
          };
          lspsaga = {
            enable = true;
          };
          lspkind = {
            enable = true;
            cmp.enable = true;
          };
          gitsigns = {
            enable = true;
          };
          lualine = {
            enable = true;
          };
          none-ls = {
            enable = true;
            sources = {
              formatting = {
                nixpkgs_fmt.enable = true;
              };
            };
          };
          nvim-tree = {
            enable = true;
          };
          nvim-autopairs = {
            enable = true;
          };
          which-key = {
            enable = true;
            settings = {
              show_keys = true;
            };
          };
          barbar = {
            enable = true;
            settings = {
              insert_at_start = true;
            };
          };
        };
      };
    };
  };
}
