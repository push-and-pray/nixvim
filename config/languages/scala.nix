{_, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers.metals.enable = true;
    };
    none-ls = {
      enable = true;
      sources = {
        formatting = {
          scalafmt.enable = true;
        };
      };
    };
  };
}
