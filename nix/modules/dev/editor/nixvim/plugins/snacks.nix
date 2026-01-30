{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
      indent.enabled = true;
      input.enabled = true;
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      scope.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = true;
      words.enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>un";
      action.__raw = "function() Snacks.notifier.show_history() end";
      options.desc = "Notification History";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action.__raw = "function() Snacks.bufdelete() end";
      options.desc = "Delete Buffer";
    }
    {
      mode = "n";
      key = "<leader>cR";
      action.__raw = "function() Snacks.rename.rename_file() end";
      options.desc = "Rename File";
    }
    {
      mode = "n";
      key = "<leader>gB";
      action.__raw = "function() Snacks.gitbrowse() end";
      options.desc = "Git Browse";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = "function() Snacks.git.blame_line() end";
      options.desc = "Git Blame Line";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action.__raw = "function() Snacks.lazygit.log_file() end";
      options.desc = "Lazygit Current File Log";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = "function() Snacks.lazygit() end";
      options.desc = "Lazygit";
    }
    {
      mode = "n";
      key = "<leader>gl";
      action.__raw = "function() Snacks.lazygit.log() end";
      options.desc = "Lazygit Log";
    }
    {
      mode = "n";
      key = "<leader>n";
      action.__raw = "function() Snacks.notifier.show_history() end";
      options.desc = "Notification History";
    }
    {
      mode = "n";
      key = "<leader>un";
      action.__raw = "function() Snacks.notifier.hide() end";
      options.desc = "Dismiss All Notifications";
    }
  ];
}
