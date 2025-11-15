{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
    };

    none-ls = {
      enable = true;
      enableLspFormat = true;

      sources = {
        code_actions = {
          gitrebase.enable = true;
          gitsigns.enable = true;
        };
        diagnostics = {
        };
        formatting = {
          prettier.enable = true;
        };
      };
    };

    fidget.enable = true;

    lsp-format.enable = true;

    which-key = {
      settings.spec = [
        {
          __unkeyed = "<leader>d";
          desc = "Debugger";
          icon = "";
        }
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ee";
      action.__raw = ''
        function()
          vim.diagnostic.open_float()
        end
      '';
      options.desc = "Show diagnostics";
    }
    {
      mode = "n";
      key = "<leader>e.";
      action.__raw = ''
        function()
          vim.diagnostic.goto_next()
        end
      '';
      options.desc = "Goto next diagnostic";
    }
    {
      mode = "n";
      key = "<leader>e,";
      action.__raw = ''
        function()
          vim.diagnostic.open_float()
        end
      '';
      options.desc = "Goto previous diagnostic";
    }
    {
      mode = "n";
      key = "K";
      action.__raw = ''
        function()
          vim.lsp.buf.hover()
        end
      '';
      options.desc = "Hover";
    }
    {
      mode = "n";
      key = "gd";
      action.__raw = ''
        function()
          vim.lsp.buf.definition()
        end
      '';
      options.desc = "Goto Definition";
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = ''
        function()
          vim.lsp.buf.declaration()
        end
      '';
      options.desc = "Goto Declaration";
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = ''
        function()
          vim.lsp.buf.references()
        end
      '';
      options.desc = "Goto References";
    }
    {
      mode = "n";
      key = "gi";
      action.__raw = ''
        function()
          vim.lsp.buf.implementation()
        end
      '';
      options.desc = "Goto Implementation";
    }
    {
      mode = "n";
      key = "gT";
      action.__raw = ''
        function()
          vim.lsp.buf.type_definition()
        end
      '';
      options.desc = "Type Definition";
    }
    {
      mode = "n";
      key = "gds";
      action.__raw = ''
        function()
          vim.lsp.buf.document_symbol()
        end
      '';
      options.desc = "Search Buffer for Symbol";
    }
    {
      mode = "n";
      key = "gws";
      action.__raw = ''
        function()
          vim.lsp.buf.workspace_symbol()
        end
      '';
      options.desc = "Search Workspace for Symbol";
    }
    {
      mode = "n";
      key = "<leader>cr";
      action.__raw = ''
        function()
          vim.lsp.buf.rename()
        end
      '';
      options.desc = "Rename Symbol";
    }
    {
      mode = "n";
      key = "<leader>ca";
      action.__raw = ''
        function()
          vim.lsp.buf.code_action()
        end
      '';
      options.desc = "Code Action";
    }
    {
      mode = "n";
      key = "<leader>cl";
      action.__raw = ''
        function()
          vim.lsp.codelens.run()
        end
      '';
      options.desc = "Code Lens";
    }
  ];
}
