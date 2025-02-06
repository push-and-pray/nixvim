{pkgs, ...}: {
  extraPlugins = with pkgs; [vimPlugins.typst-preview-nvim];
  extraConfigLua = ''
    require 'typst-preview'.setup {}
  '';
  plugins = {
    lsp = {
      enable = true;
      servers.tinymist.enable = true;
    };
    none-ls = {
      enable = true;
      sources = {
        formatting = {
          typstyle.enable = true;
        };
      };
    };
  };
}
