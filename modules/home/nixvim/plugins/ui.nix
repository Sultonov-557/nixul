{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        settings = {
          options = {
            icons_enabled = true;
            theme = "auto";
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
            globalstatus = true;
          };
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [
              "branch"
              "diff"
              "diagnostics"
            ];
            lualine_c = [ "filename" ];
            lualine_x = [
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = [ "progress" ];
            lualine_z = [ "location" ];
          };
        };
      };

      which-key = {
        enable = true;
        settings = {
          delay = 300;
          spec = [
            {
              __unkeyed-1 = "<leader>f";
              group = "Find";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
            }
            {
              __unkeyed-1 = "<leader>b";
              group = "Buffer";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
            }
            {
              __unkeyed-1 = "<leader>h";
              group = "Harpoon";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = "Toggle/Trouble";
            }
          ];
        };
      };

      indent-blankline = {
        enable = true;
        settings = {
          indent.char = "│";
          scope = {
            enabled = true;
            show_start = true;
            show_end = false;
          };
        };
      };

      noice = {
        enable = true;
        settings = {
          lsp.override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
          };
        };
      };

      nvim-colorizer = {
        enable = true;
        userDefaultOptions = {
          names = false;
          rgb_fn = true;
          hsl_fn = true;
          tailwind = true;
        };
      };

      dressing = {
        enable = true;
      };

      notify = {
        enable = true;
        backgroundColour = "#000000";
        fps = 60;
        render = "default";
        timeout = 3000;
        topDown = true;
      };
    };
  };
}
