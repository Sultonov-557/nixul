{
  keymaps = [
    # Core
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
      action = "<cmd>qa<CR>";
      options.desc = "Quit all";
    }

    # Window Management
    {
      mode = "n";
      key = "<leader>w";
      action = "<C-w>";
      options.desc = "Window";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-w>s";
      options.desc = "Split window below";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-w>v";
      options.desc = "Split window right";
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-w>c";
      options.desc = "Delete window";
    }

    # Buffer Management
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<CR>";
      options.desc = "Prev buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<CR>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<CR>";
      options.desc = "Switch to Other Buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options.desc = "Delete buffer";
    }

    # Move Lines
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>==";
      options.desc = "Move down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>==";
      options.desc = "Move up";
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      options.desc = "Move down";
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      options.desc = "Move up";
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

    # Better Indenting
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

    # Search & Navigation
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

    # Tabs
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options.desc = "Last Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options.desc = "First Tab";
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options.desc = "New Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options.desc = "Next Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options.desc = "Close Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<cr>";
      options.desc = "Previous Tab";
    }

    # Clipboard
    {
      mode = [ "n" "v" ];
      key = "<leader>y";
      action = ''"+y'';
      options.desc = "Yank to system clipboard";
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = ''"+Y'';
      options.desc = "Yank line to system clipboard";
    }

    # Utils
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
}
