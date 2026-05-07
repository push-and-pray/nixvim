{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
        pyright.package = null;
      };
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        python = ["isort"];
      };
    };

    lint.lintersByFt = {
      python = ["ruff"];
    };
  };
}
