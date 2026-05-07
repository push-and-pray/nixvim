{pkgs, ...}: {
  plugins = {
    dap-go.enable = true;
    lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
      };
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        go = ["golangci-lint"];
      };
    };

    lint.lintersByFt = {
      go = ["golangcilint"];
    };
  };
}
