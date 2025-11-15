{pkgs, ...}: {
  extraPackages = with pkgs; [
    statix
    alejandra
  ];
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        nix = ["alejandra"];
      };
    };

    lint.lintersByFt = {
      nix = ["statix"];
    };
  };
}
