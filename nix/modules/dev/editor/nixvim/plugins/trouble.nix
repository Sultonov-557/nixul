{
  plugins.trouble = {
    enable = true;
    settings = {
      modes = {
        preview_float = {
          mode = "diagnostics";
          preview = {
            type = "float";
            relative = "editor";
            border = "rounded";
            title = "Preview";
            title_pos = "center";
            position = [
              0
              2
            ];
            size = {
              width = 0.3;
              height = 0.3;
            };
            zindex = 200;
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options.desc = "Toggle diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
      options.desc = "Buffer diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xs";
      action = "<cmd>Trouble symbols toggle focus=false<CR>";
      options.desc = "Symbols (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<CR>";
      options.desc = "LSP definitions/references (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<cmd>Trouble loclist toggle<CR>";
      options.desc = "Location list (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<cmd>Trouble qflist toggle<CR>";
      options.desc = "Quickfix list (Trouble)";
    }
  ];
}
