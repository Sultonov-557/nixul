{
  plugins = {
    # File tree
    nvim-tree = {
      enable = false;
      settings = {
        disableNetrw = true;
        updateFocusedFile.enable = true;
        renderer = {
          groupEmpty = true;
          highlightGit = true;
          icons = {
            show = {
              file = true;
              folder = true;
              folderArrow = true;
              git = true;
            };
          };
        };
        view = {
          width = 30;
          side = "left";
        };
        filters = {
          dotfiles = false;
          custom = [ "^\\.git$" ];
        };
      };
    };

    neo-tree = {
      enable = true;
      settings = {
        enable_diagnostics = true;
        enable_git_status = true;
        enable_modified_markers = true;
        enable_refresh_on_write = true;
        close_if_last_window = true;
        popup_border_style = "rounded";

        sources = [
          "filesystem"
          "buffers"
          "git_status"
        ];

        filesystem = {
          bind_to_cwd = false;
          follow_current_file.enabled = true;
          use_libuv_file_watcher = true;
        };
      };
    };

    # Harpoon - Quick file navigation (harpoon2)
    harpoon = {
      enable = true;
      enableTelescope = true;
    };

    # Oil - Edit filesystem like a buffer
    oil = {
      enable = true;
      settings = {
        columns = [ "icon" ];
        view_options = {
          show_hidden = true;
        };
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-v>" = "actions.select_vsplit";
          "<C-x>" = "actions.select_split";
          "<C-t>" = "actions.select_tab";
          "<C-p>" = "actions.preview";
          "<C-c>" = "actions.close";
          "<C-r>" = "actions.refresh";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "g." = "actions.toggle_hidden";
        };
      };
    };

    # Undotree - Visualize undo history
    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };

    # Marks - Better mark visualization
    marks = {
      enable = true;
      settings = {
        defaultMappings = true;
        signs = true;
        cyclic = true;
      };
    };
  };

  keymaps = [
    # File tree toggle - Using lowercase 'e' as requested
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options.desc = "Explorer NeoTree (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree focus<CR>";
      options.desc = "Explorer NeoTree (cwd)";
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Neotree toggle<CR>";
      options.desc = "Explorer NeoTree (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>Neotree focus<CR>";
      options.desc = "Explorer NeoTree (cwd)";
    }

    # Oil keybind
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<CR>";
      options.desc = "Open oil (directory editor)";
    }

    # Undotree
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<CR>";
      options.desc = "Toggle undotree";
    }

    # Harpoon2 keybinds
    {
      mode = "n";
      key = "<leader>ha";
      action.__raw = "function() require('harpoon'):list():add() end";
      options.desc = "Harpoon add file";
    }
    {
      mode = "n";
      key = "<leader>hh";
      action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
      options.desc = "Harpoon menu";
    }
    {
      mode = "n";
      key = "<leader>h1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      options.desc = "Harpoon file 1";
    }
    {
      mode = "n";
      key = "<leader>h2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      options.desc = "Harpoon file 2";
    }
    {
      mode = "n";
      key = "<leader>h3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      options.desc = "Harpoon file 3";
    }
    {
      mode = "n";
      key = "<leader>h4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      options.desc = "Harpoon file 4";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = "function() require('harpoon'):list():prev() end";
      options.desc = "Harpoon prev";
    }
    {
      mode = "n";
      key = "<leader>hn";
      action.__raw = "function() require('harpoon'):list():next() end";
      options.desc = "Harpoon next";
    }
  ];
}
