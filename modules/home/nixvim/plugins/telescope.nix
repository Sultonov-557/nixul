{
  programs.nixvim = {
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
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Help tags";
        };
        "<leader>fo" = {
          action = "oldfiles";
          options.desc = "Recent files";
        };
        "<leader>fw" = {
          action = "grep_string";
          options.desc = "Find word";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Git commits";
        };
        "<leader>gb" = {
          action = "git_branches";
          options.desc = "Git branches";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "Git status";
        };
        "<leader>fr" = {
          action = "lsp_references";
          options.desc = "LSP references";
        };
        "<leader>fs" = {
          action = "lsp_document_symbols";
          options.desc = "Document symbols";
        };
        "<leader>fS" = {
          action = "lsp_workspace_symbols";
          options.desc = "Workspace symbols";
        };
      };
    };
  };
}
