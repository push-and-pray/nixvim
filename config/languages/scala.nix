{pkgs, ...}: let
  metals = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-metals";
    version = "v0.10.x";
    src = pkgs.fetchFromGitHub {
      owner = "scalameta";
      repo = "nvim-metals";
      rev = "v0.10.x";
      sha256 = "sha256-SFvyaspY4hguxqW5hCAM5QwNZJwFb0hzkClD7q9F1is=";
    };
    meta.homepage = "https://github.com/scalameta/nvim-metals/";
    meta.hydraPlatforms = [];
  };
in {
  extraPlugins = [
    metals
  ];
  extraConfigLua = ''
    local metals = require("metals")
    local config = metals.bare_config()
    config.init_options.statusBarProvider = "off"
    config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
    end

    local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(config)
      end,
      group = group,
    })
  '';

  plugins = {
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
