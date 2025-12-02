{
  plugins = {
    trouble = {
      enable = true;
      settings = {
        use_diagnostic_signs = true;
      };
    };

    todo-comments = {
      enable = true;
      settings = {
        signs = true;
        sign_priority = 8;
        keywords = {
          FIX = {
            icon = " ";
            color = "error";
            alt = [
              "FIXME"
              "BUG"
              "FIXIT"
              "ISSUE"
            ];
          };
          TODO = {
            icon = " ";
            color = "info";
          };
          HACK = {
            icon = " ";
            color = "warning";
          };
          WARN = {
            icon = " ";
            color = "warning";
            alt = [
              "WARNING"
              "XXX"
            ];
          };
          PERF = {
            icon = " ";
            alt = [
              "OPTIM"
              "PERFORMANCE"
              "OPTIMIZE"
            ];
          };
          NOTE = {
            icon = " ";
            color = "hint";
            alt = [ "INFO" ];
          };
        };
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts = {
          border = "curved";
        };
        open_mapping = "[[<C-\\>]]";
        hide_numbers = true;
        shade_terminals = true;
        start_in_insert = true;
        persist_size = true;
        close_on_exit = true;
      };
    };

    markdown-preview = {
      enable = true;
      settings.theme = "dark";
    };

    undotree = {
      enable = true;
      settings = {
        focusOnToggle = true;
        autoOpenDiff = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options.desc = "Toggle diagnostics";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<CMD>TodoTelescope<CR>";
      options.desc = "Find TODOs";
    }
    {
      mode = "n";
      key = "<leader>u";
      action = "<CMD>UndotreeToggle<CR>";
      options.desc = "Toggle undo tree";
    }
  ];
}
