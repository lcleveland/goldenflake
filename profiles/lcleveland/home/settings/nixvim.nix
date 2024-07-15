{ inputs, settings, ... }: {
  home-manager.users.${settings.username} = {
    imports = [
      inputs.nixvim.homeManagerModules.nixvim
    ];
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
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
        cmp-cmdline = {
          enable = true;
        };
        cmp-buffer = {
          enable = true;
        };
        noice = {
          enable = true;
        };
        treesitter = {
          enable = true;
          settings = {
            auto_install = true;
            parser_install_dir = "/home/${settings.username}/.config/nvim/treesitter";
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
          showKeys = true;
        };
      };
    };
  };
}
