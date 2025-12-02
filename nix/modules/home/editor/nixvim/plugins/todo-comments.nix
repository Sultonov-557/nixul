{
  plugins.todo-comments = {
    enable = true;
    settings = {
      signs = true;
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
        TEST = {
          icon = "⏲ ";
          color = "test";
          alt = [
            "TESTING"
            "PASSED"
            "FAILED"
          ];
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>TodoTelescope<CR>";
      options.desc = "Find todos";
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<CR>";
      options.desc = "Todos (Trouble)";
    }
    {
      mode = "n";
      key = "]t";
      action.__raw = ''
        function()
          require("todo-comments").jump_next()
        end
      '';
      options.desc = "Next todo comment";
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = ''
        function()
          require("todo-comments").jump_prev()
        end
      '';
      options.desc = "Previous todo comment";
    }
  ];
}
