{pkgs, ...}: {
  extraPackages = with pkgs; [
    ripgrep
    xdg-utils
  ];
  extraConfigLua = ''
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  '';
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
        settings = {
          auto_depth = true;
          hijack_netrw = true;
          respect_gitignore = true;
          mappings = {
            "i" = {
              "<C-g>" = {
                __raw = "require('telescope').extensions.file_browser.actions.toggle_respect_gitignore";
              };
            };
            "n" = {
              "<C-g>" = {
                __raw = "require('telescope').extensions.file_browser.actions.toggle_respect_gitignore";
              };
            };
          };
        };
      };
      ui-select.enable = true;
      fzf-native.enable = true;
    };

    keymaps = {
      "<leader><leader>" = {
        action = "file_browser";
        options = {
          desc = "Find Files";
        };
      };
      "<leader>f:" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>fr" = {
        action = "live_grep";
        options = {
          desc = "Grep";
        };
      };
      "<leader>fd" = {
        action = "diagnostics";
        options = {
          desc = "Workspace diagnostics";
        };
      };
    };
  };
}
