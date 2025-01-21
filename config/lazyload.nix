{_, ...}: {
  plugins = {
    lz-n.enable = true;
    toggleterm = {
      lazyLoad = {
        settings = {
          cmd = "ToggleTerm";
          keys = [
            "<C-t>"
          ];
        };
      };
    };
    treesitter = {
      lazyLoad = {
        settings = {
          event = "BufEnter";
        };
      };
    };
    luasnip = {
      lazyLoad = {
        settings = {
          event = "InsertEnter";
        };
      };
    };
    render-markdown = {
      lazyLoad = {
        settings = {
          ft = "md";
        };
      };
    };
    crates = {
      lazyLoad = {
        settings = {
          ft = "toml";
        };
      };
    };
  };
}
