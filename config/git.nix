{config, ...}: {
  plugins = {
    gitlinker = {
      enable = true;
      settings = {
        opts = {
          print_url = false;
        };
      };
    };

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
      };
    };

    lazygit.enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit ";
      };
    }
  ];
}
