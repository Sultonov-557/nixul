{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;

      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;

      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      termguicolors = true;
      signcolumn = "yes";
      cursorline = true;

      clipboard = "unnamedplus";

      splitbelow = true;
      splitright = true;

      swapfile = false;
      backup = false;
      undofile = true;

      updatetime = 250;
      timeoutlen = 300;

      completeopt = [
        "menu"
        "menuone"
        "noselect"
      ];

      conceallevel = 0;
      fileencoding = "utf-8";

      mouse = "a";

      pumheight = 10;
      showmode = false;
      showtabline = 2;

      laststatus = 3;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    autoCmd = [
      {
        event = [ "BufWritePre" ];
        pattern = [ "*" ];
        command = "%s/\\s\\+$//e";
        desc = "Remove trailing whitespace on save";
      }
      {
        event = [ "TextYankPost" ];
        pattern = [ "*" ];
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({ timeout = 200 })
            end
          '';
        };
        desc = "Highlight on yank";
      }
    ];
  };
}
