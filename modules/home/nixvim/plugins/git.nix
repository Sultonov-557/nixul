{
  plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
        signs = {
          add.text = "│";
          change.text = "│";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
          untracked.text = "┆";
        };
      };
    };

    fugitive.enable = true;

    lazygit = {
      enable = true;
    };

    diffview = {
      enable = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<CMD>LazyGit<CR>";
      options.desc = "Open LazyGit";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<CMD>DiffviewOpen<CR>";
      options.desc = "Open diff view";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<CMD>DiffviewFileHistory<CR>";
      options.desc = "File history";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<CMD>DiffviewFileHistory %<CR>";
      options.desc = "Current file history";
    }
  ];
}
