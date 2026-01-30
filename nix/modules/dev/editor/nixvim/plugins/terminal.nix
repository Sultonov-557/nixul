{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
        width = 120;
        height = 30;
      };
      open_mapping = "[[<C-\\>]]";
      shade_terminals = true;
      start_in_insert = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm direction=float<CR>";
      options.desc = "Toggle floating terminal";
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal size=15<CR>";
      options.desc = "Toggle horizontal terminal";
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical size=80<CR>";
      options.desc = "Toggle vertical terminal";
    }
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    {
      mode = "t";
      key = "<C-h>";
      action = "<cmd>wincmd h<CR>";
      options.desc = "Navigate left from terminal";
    }
    {
      mode = "t";
      key = "<C-j>";
      action = "<cmd>wincmd j<CR>";
      options.desc = "Navigate down from terminal";
    }
    {
      mode = "t";
      key = "<C-k>";
      action = "<cmd>wincmd k<CR>";
      options.desc = "Navigate up from terminal";
    }
    {
      mode = "t";
      key = "<C-l>";
      action = "<cmd>wincmd l<CR>";
      options.desc = "Navigate right from terminal";
    }
  ];
}
