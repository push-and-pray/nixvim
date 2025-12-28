{_, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        zls.enable = true;
      };
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        zig = ["zigfmt"];
      };
    };

    lint.lintersByFt = {
      zig = ["zlint"];
    };

    neotest = {
      enable = true;
      adapters = {
        zig.enable = true;
      };
    };
  };
}
