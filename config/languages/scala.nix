{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.nvim-metals
  ];

  extraConfigLua = ''
    local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        local metals = require("metals")
        local config = metals.bare_config()

        config.settings = {
          metalsBinaryPath = vim.fn.exepath("metals"),
        }

        config.init_options.statusBarProvider = "off"
        config.capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

        config.on_attach = function(client, bufnr)
            require("metals").setup_dap()
        end

        metals.initialize_or_attach(config)
      end,
      group = group,
    })
  '';

  plugins = {
    conform-nvim = {
      settings.formatters_by_ft = {
        scala = ["scalafmt"];
        sbt = ["scalafmt"];
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
        scala.settings = {
          framework = "scalatest";
        };
      };
    };
  };
}
