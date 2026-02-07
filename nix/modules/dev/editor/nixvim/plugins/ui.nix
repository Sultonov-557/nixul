{

  plugins = {
    web-devicons.enable = true;

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
          lualine_c = [
            "filename"
            {
              __unkeyed-1 = "searchcount";
              maxcount = 999;
              timeout = 500;
            }
          ];
          lualine_x = [
            {
              __unkeyed-1 = "lsp_progress";
              display_components = [
                "lsp_client_name"
                "spinner"
                {
                  __unkeyed-1 = "title";
                  "percentage" = true;
                }
              ];
              timer = {
                progress_enddelay = 500;
                spinner_array = [
                  "⠋"
                  "⠙"
                  "⠹"
                  "⠸"
                  "⠼"
                  "⠴"
                  "⠦"
                  "⠧"
                  "⠇"
                  "⠏"
                ];
              };
            }
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
            group = "file/find";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "git";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = "buffer";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "code";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "search";
          }
          {
            __unkeyed-1 = "<leader>x";
            group = "diagnostics/quickfix";
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "window";
          }
          {
            __unkeyed-1 = "<leader>q";
            group = "session";
          }
          {
            __unkeyed-1 = "<leader><tab>";
            group = "tabs";
          }
        ];
      };
    };

    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "│";
        scope.enabled = false; # Handled by snacks.scope
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

    colorizer = {
      enable = true;
      settings = {
        user_default_options = {
          names = false;
          rgb_fn = true;
          hsl_fn = true;
          tailwind = true;
        };
      };
    };

    dressing = {
      enable = true;
    };

    notify.enable = false; # Handled by snacks.notifier

    mini = {
      enable = true;
      modules = {
        indentscope.enabled = false; # Handled by snacks.scope
        animate = {
          cursor.enable = false; # Often distracting, but can be enabled if desired
          scroll.enable = false; # Handled by snacks.scroll or neoscroll
          window = {
            enable = true;
          };
        };
      };
    };
  };
}
