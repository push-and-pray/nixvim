{
  pkgs,
  lib,
  ...
}: {
  plugins = {
    dap-lldb = {
      enable = true;
      settings = {
        codelldb_path = lib.getExe' pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter "codelldb";
      };
    };
    dap = {
      configurations = {
        c = [
          {
            name = "Launch";
            type = "lldb";
            request = "launch";
            program.__raw = ''
              function()
                local build_dir = vim.fn.getcwd() .. '/build/'
                local start_path = vim.fn.isdirectory(build_dir) == 1 and build_dir or vim.fn.getcwd() .. '/'
                return vim.fn.input('Path to executable: ', start_path, 'file')
              end
            '';
            cwd = "\${workspaceFolder}";
            stopOnEntry = false;
            args = [];
          }
        ];
      };
    };

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
      };
    };

    conform-nvim = {
      settings.formatters_by_ft = {
        c = ["clang-format"];
        cpp = ["clang-format"];
      };
    };

    lint = {
      enable = true;
      lintersByFt = {
        c = ["clangtidy"];
        cpp = ["clangtidy"];
      };
    };
  };
}
