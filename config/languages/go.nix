{_, ...}: {
  plugins = {
    dap-go.enable = true;
    lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
      };
    };
    neotest = {
      enable = true;
      adapters = {
        go.enable = true;
      };
    };
    none-ls = {
      enable = true;
      sources = {
        formatting = {
          gofmt.enable = true;
        };
      };
    };
  };
}
