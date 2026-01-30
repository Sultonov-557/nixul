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
      key = "<leader>xx";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<CMD>Trouble diagnostics toggle filter.buf=0<CR>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<CMD>Trouble symbols toggle focus=false<CR>";
      options.desc = "Symbols (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>st";
      action = "<CMD>TodoTelescope<CR>";
      options.desc = "Todo (Telescope)";
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<CMD>TodoTrouble<CR>";
      options.desc = "Todo (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>fT";
      action = "<CMD>ToggleTerm<CR>";
      options.desc = "Terminal (Floating)";
    }
    {
      mode = "n";
      key = "<leader>u";
      action = "<CMD>UndotreeToggle<CR>";
      options.desc = "Toggle undo tree";
    }
  ];
}
