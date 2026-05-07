{_, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        zls = {
          enable = true;
          package = null;
          settings = {
            zls = {
              enable_build_on_save = true;
            };
          };
        };
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
  };
}
