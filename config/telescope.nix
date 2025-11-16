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
          hijack_netrw = true;
          auto_depth = true;
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
      "<leader>ff" = {
        action = "file_browser";
        options = {
          desc = "File Browser";
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
      "<leader>fg" = {
        action = "git_files";
        options = {
          desc = "Search git files";
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
