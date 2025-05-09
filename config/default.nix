{pkgs, ...}: {
  imports = [
    ./cmp.nix
    ./git.nix
    ./lsp.nix
    ./telescope.nix
    ./extraplugins.nix
    ./languages
    ./lazyload.nix
    ./dap.nix
  ];

  colorschemes.gruvbox.enable = true;

  globals.mapleader = " ";
  opts = {
    number = true;
    relativenumber = true;

    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;

    smartindent = true;
    shiftwidth = 2;

    breakindent = true;

    ignorecase = true;
    smartcase = true; # Don't ignore case with capitals

    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];

    swapfile = false;
    backup = false;
    undofile = true;

    cursorline = true;
    termguicolors = true;
    scrolloff = 8;
    showmode = false;

    splitbelow = true;
    splitright = true;
  };

  plugins = {
    markview = {
      enable = true;
      settings = {
        preview = {
          hybrid_modes = ["i" "r"];
          modes = ["n" "x"];
        };
      };
    };
    harpoon = {
      enable = true;
    };
    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]";
      };
    };
    lightline.enable = true;

    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
    };

    web-devicons.enable = true;

    comment.enable = true;
    colorizer.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    notify.enable = true;

    mini = {
      enable = true;
      modules = {
        files = {
          mappings = {
            synchronize = "<leader><leader>";
          };
        };
      };
    };
  };
  keymaps = [
    {
      action = "<cmd>lua MiniFiles.open()<CR>";
      key = "<leader><leader>";
      options.desc = "Files";
    }
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<leader>.";
      action.__raw = "function() require'harpoon':list():next() end";
    }
    {
      mode = "n";
      key = "<leader>,";
      action.__raw = "function() require'harpoon':list():prev() end";
    }
  ];
}
