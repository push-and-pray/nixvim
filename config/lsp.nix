{pkgs, ...}: {
    plugins = {
      otter.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          gopls.enable = true;
          zls.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>E" = {
              action = "open_float";
              desc = "Show diagnostics";
            };
            "<A-k>" = {
              action = "goto_prev";
              desc = "Goto Previous Error";
            };
            "<A-j>" = {
              action = "goto_next";
              desc = "Goto Next Error";
            };
          };
          lspBuf = {
            K = {
              action = "hover";
              desc = "Hover";
            };
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename Symbol";
            };
            "<leader>ca" = {
              action = "code_action";
              desc = "Code Action";
            };
          };
        };
      };

      nvim-lightbulb.enable = true;

      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };

      none-ls = {
        enable = true;
        enableLspFormat = true;

        sources = {
          code_actions = {
            gitrebase.enable = true;
            gitsigns.enable = true;
          };
          diagnostics = {
          };
          formatting = {
            prettier.enable = true;
            gofmt.enable = true;
          };
        };
      };

      fidget.enable = true;

      lsp-format.enable = true;
    };
}
