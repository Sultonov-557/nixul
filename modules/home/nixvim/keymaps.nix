{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options.desc = "Clear search highlight";
      }

      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<CR>";
        options.desc = "Save file";
      }

      {
        mode = "n";
        key = "<C-q>";
        action = "<cmd>q<CR>";
        options.desc = "Quit";
      }

      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Move to left window";
      }

      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Move to bottom window";
      }

      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Move to top window";
      }

      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Move to right window";
      }

      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<CR>";
        options.desc = "Increase window height";
      }

      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<CR>";
        options.desc = "Decrease window height";
      }

      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<CR>";
        options.desc = "Decrease window width";
      }

      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<CR>";
        options.desc = "Increase window width";
      }

      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
        options.desc = "Previous buffer";
      }

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<CR>";
        options.desc = "Next buffer";
      }

      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
        options.desc = "Delete buffer";
      }

      {
        mode = "v";
        key = "<";
        action = "<gv";
        options.desc = "Indent left";
      }

      {
        mode = "v";
        key = ">";
        action = ">gv";
        options.desc = "Indent right";
      }

      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Move line down";
      }

      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options.desc = "Move line up";
      }

      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
        options.desc = "Join lines keeping cursor";
      }

      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "Page down centered";
      }

      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "Page up centered";
      }

      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options.desc = "Next search centered";
      }

      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options.desc = "Previous search centered";
      }

      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Yank to system clipboard";
      }

      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
        options.desc = "Yank line to system clipboard";
      }

      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>d";
        action = "\"_d";
        options.desc = "Delete to void register";
      }

      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>!chmod +x %<CR>";
        options = {
          silent = true;
          desc = "Make file executable";
        };
      }
    ];
  };
}
