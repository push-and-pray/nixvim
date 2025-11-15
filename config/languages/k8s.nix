{
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [
    (
      (pkgs.vimUtils.buildVimPlugin {
        name = "yaml-schema-detect";
        src = pkgs.fetchFromGitHub {
          owner = "cwrau";
          repo = "yaml-schema-detect.nvim";
          rev = "605f81b2dc3243b61017db7099a808e8ea350566";
          hash = "sha256-RTblSvtz0/jbjWAe+MI4EXS87Q/lUlPyt/1E2yquXtY=";
        };
      }).overrideAttrs (oldAttrs: {
        dependencies = with pkgs.vimPlugins; [
          plenary-nvim
          nvim-lspconfig
        ];
      })
    )
  ];
  extraConfigLua = "require('yaml-schema-detect').setup()";
  plugins = {
    lsp = {
      enable = true;
      servers = {
        yamlls = {
          enable = true;
          settings = {
            schemas = {
              kubernetes = "*.yaml";
              "https://json.schemastore.org/chart" = "Chart.{yml,yaml}";
              "https://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
            };
          };
        };
      };
    };
  };
}
