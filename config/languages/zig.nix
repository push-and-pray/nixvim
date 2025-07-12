{_, ...}: {
  plugins = {
    zig.enable = true;
    lsp = {
      enable = true;
      servers = {
        zls.enable = true;
      };
    };
    neotest = {
      enable = true;
      adapters = {
        zig.enable = true;
      };
    };
  };
}
