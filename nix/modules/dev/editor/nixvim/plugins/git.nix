{
  plugins = {
    git-worktree = {
      enable = true;
      enableTelescope = true;
    };

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
      options.desc = "LazyGit (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>gG";
      action = "<CMD>LazyGitCurrentFile<CR>";
      options.desc = "LazyGit (cwd)";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<cr>";
      options.desc = "Blame Line";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<CMD>DiffviewOpen<CR>";
      options.desc = "Diffview Open";
    }
    {
      mode = "n";
      key = "<leader>gw";
      action = "<CMD>Telescope git_worktree<CR>";
      options.desc = "Git Worktrees";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<CMD>DiffviewFileHistory<CR>";
      options.desc = "Diffview File History";
    }
  ];
}
