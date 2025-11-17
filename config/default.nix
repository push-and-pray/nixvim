{pkgs, ...}: {
  imports = [
    ./cmp.nix
    ./git.nix
    ./lsp.nix
    ./telescope.nix
    ./extraplugins.nix
    ./languages
    ./dap.nix
  ];

  colorschemes.gruvbox.enable = true;

  globals.mapleader = " ";
  opts = {
    number = true;
    relativenumber = true;
    wrap = false;

    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;

    smartindent = true;
    shiftwidth = 2;

    breakindent = true;

    ignorecase = true;
    smartcase = true;

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
    lz-n.enable = true;
    harpoon = {
      enable = true;
    };

    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]";
      };
      lazyLoad = {
        settings = {
          cmd = "ToggleTerm";
          keys = [
            "<C-t>"
          ];
        };
      };
    };

    lightline.enable = true;

    treesitter-textobjects.enable = true;
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
      mode = "n";
      key = "<leader>ff";
      options.desc = "Files";
      action = "<cmd>lua MiniFiles.open()<CR>";
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
