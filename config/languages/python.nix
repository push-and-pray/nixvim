{pkgs, ...}: {
  keymaps = [
    {
      mode = "n";
      key = "<leader>dpr";
      action.__raw = ''
        function()
          require("dap-python").test_method()
        end
      '';
      options.desc = "Debug nearest Python test method";
    }
    {
      mode = "n";
      key = "<leader>dpc";
      action.__raw = ''
        function()
          require("dap-python").test_class()
        end
      '';
      options.desc = "Debug Python test class";
    }
  ];
  plugins = {
    dap-python = {
      enable = true;
      resolvePython = ''
        function()
          local path = vim.fn.exepath("python3")
          if path ~= "" then
            return path
          end
          return nil
        end
      '';
    };
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
