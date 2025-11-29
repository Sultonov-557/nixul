{
  plugins = {
    oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirm_for_simple_edits = true;
        view_options = {
          show_hidden = true;
          natural_order = true;
        };
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-v>" = "actions.select_vsplit";
          "<C-x>" = "actions.select_split";
          "<C-t>" = "actions.select_tab";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "g." = "actions.toggle_hidden";
        };
      };
    };

    neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = false;
      };
      filesystem = {
        followCurrentFile.enabled = true;
        useLibuvFileWatcher = true;
      };
    };

    harpoon = {
      enable = true;
      enableTelescope = true;
      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>hh";
        navFile = {
          "1" = "<leader>h1";
          "2" = "<leader>h2";
          "3" = "<leader>h3";
          "4" = "<leader>h4";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<CMD>Oil<CR>";
      options.desc = "Open parent directory";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<CMD>Neotree toggle<CR>";
      options.desc = "Toggle file explorer";
    }
  ];
}
