{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          mode = "buffers";
          numbers = "none";
          close_command = "bdelete! %d";
          right_mouse_command = "bdelete! %d";
          left_mouse_command = "buffer %d";
          middle_mouse_command = null;
          indicator.style = "underline";
          buffer_close_icon = "󰅖";
          modified_icon = "●";
          close_icon = "";
          left_trunc_marker = "";
          right_trunc_marker = "";
          diagnostics = "nvim_lsp";
          diagnostics_indicator = ''
            function(count, level, diagnostics_dict, context)
              local s = " "
              for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                  or (e == "warning" and " " or "" )
                s = s .. n .. sym
              end
              return s
            end
          '';
          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              text_align = "center";
              separator = true;
            }
          ];
          show_buffer_icons = true;
          show_buffer_close_icons = true;
          show_close_icon = true;
          show_tab_indicators = true;
          separator_style = "slant";
          always_show_bufferline = true;
          sort_by = "insert_after_current";
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>bp";
        action = "<CMD>BufferLineTogglePin<CR>";
        options.desc = "Pin buffer";
      }
      {
        mode = "n";
        key = "<leader>bP";
        action = "<CMD>BufferLineGroupClose ungrouped<CR>";
        options.desc = "Close unpinned buffers";
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<CMD>BufferLineCloseOthers<CR>";
        options.desc = "Close other buffers";
      }
      {
        mode = "n";
        key = "<leader>br";
        action = "<CMD>BufferLineCloseRight<CR>";
        options.desc = "Close buffers to right";
      }
      {
        mode = "n";
        key = "<leader>bl";
        action = "<CMD>BufferLineCloseLeft<CR>";
        options.desc = "Close buffers to left";
      }
    ];
  };
}
