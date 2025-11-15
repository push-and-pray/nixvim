{pkgs, ...}: {
  extraPackages = with pkgs; [isort ruff];
  plugins = {
    lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
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
