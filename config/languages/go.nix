{pkgs, ...}: {
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

    conform-nvim = {
      settings.formatters_by_ft = {
        go = ["gofmt"];
      };
    };
  };
}
