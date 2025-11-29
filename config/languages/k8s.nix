{...}: {
  plugins = {
    yaml-schema-detect.enable = true;
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
