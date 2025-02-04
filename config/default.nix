{pkgs, ...}: {
  imports = [
    ./cmp.nix
    ./git.nix
    ./lsp.nix
    ./telescope.nix
    ./extraplugins.nix
    ./languages
    ./lazyload.nix
  ];

  colorschemes.gruvbox.enable = true;

  performance.byteCompileLua = {
    enable = true;
    initLua = false;
    configs = true;
    plugins = true;
    nvimRuntime = true;
  };
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
    snacks = {
      settings = {
        quickfile.enable = true;
      };
    };
    markview = {
      enable = true;
      settings = {
        hybrid_modes = ["i"];
        modes = ["i" "n" "no" "c"];
      };
    };
    marks = {
      enable = true;
      mappings = {
        "previous" = "<leader>,";
        "next" = "<leader>.";
      };
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
  ];
}
