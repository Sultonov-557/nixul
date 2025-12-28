{
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };

    keymaps = {
      "<leader>," = {
        action = "buffers";
        options.desc = "Switch Buffer";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep (Root Dir)";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find Files (Root Dir)";
      };

      # find
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Buffers";
      };
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find Files (Root Dir)";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Recent";
      };

      # git
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Commits";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Status";
      };

      # search
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Buffer";
      };
      "<leader>sc" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>sC" = {
        action = "commands";
        options.desc = "Commands";
      };
      "<leader>sd" = {
        action = "diagnostics";
        options.desc = "Document Diagnostics";
      };
      "<leader>sG" = {
        action = "live_grep";
        options.desc = "Grep (Root Dir)";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Help Pages";
      };
      "<leader>sH" = {
        action = "highlights";
        options.desc = "Search Highlight Groups";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "Key Maps";
      };
      "<leader>sM" = {
        action = "man_pages";
        options.desc = "Man Pages";
      };
      "<leader>sm" = {
        action = "marks";
        options.desc = "Jump to Mark";
      };
      "<leader>so" = {
        action = "vim_options";
        options.desc = "Options";
      };
      "<leader>sR" = {
        action = "resume";
        options.desc = "Resume";
      };
      "<leader>sw" = {
        action = "grep_string";
        options.desc = "Word (Root Dir)";
      };
    };
  };
}
