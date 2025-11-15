{pkgs, ...}: {
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          preset = "enter";
          "<Tab>" = [
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "accept"
            "fallback"
          ];
        };
        snippets.preset = "luasnip";
        signature.enabled = true;
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          providers = {
            buffer = {
              score_offset = -7;
            };
          };
        };
      };
    };

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
      lazyLoad = {
        settings = {
          event = "InsertEnter";
        };
      };
    };

    lspkind = {
      enable = true;
    };
  };
}
