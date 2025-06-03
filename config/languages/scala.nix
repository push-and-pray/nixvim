{pkgs, ...}: {
  plugins = {
    lsp = {
      servers = {
        metals.enable = true;
      };
    };
    dap = {
      enable = true;
      configurations = {
        scala = [
          {
            type = "scala";
            request = "launch";
            name = "Run";
            metals = {
              runType = "run";
            };
          }
          {
            type = "scala";
            request = "launch";
            name = "Test Target";
            metals = {
              runType = "testTarget";
            };
          }
          {
            type = "scala";
            request = "launch";
            name = "Test File";
            metals = {
              runType = "testFile";
            };
          }
        ];
      };
    };

    neotest = {
      enable = true;
      adapters = {
        scala.enable = true;
      };
    };
  };
}
