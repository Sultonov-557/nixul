{
  plugins = {
    lsp = {
      enable = true;

      servers = {
        nil_ls = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
        };

        ts_ls.enable = true;

        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };

        pyright.enable = true;

        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        tailwindcss.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Go to definition";
          };
          gr = {
            action = "references";
            desc = "Go to references";
          };
          gD = {
            action = "declaration";
            desc = "Go to declaration";
          };
          gI = {
            action = "implementation";
            desc = "Go to implementation";
          };
          gt = {
            action = "type_definition";
            desc = "Go to type definition";
          };
          K = {
            action = "hover";
            desc = "Hover documentation";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code action";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "Rename symbol";
          };
        };
        diagnostic = {
          "[d" = {
            action = "goto_prev";
            desc = "Previous diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next diagnostic";
          };
          "<leader>e" = {
            action = "open_float";
            desc = "Show diagnostic";
          };
          "<leader>q" = {
            action = "setloclist";
            desc = "Diagnostic loclist";
          };
        };
      };
    };

    lsp-format.enable = true;

    lsp-lines = {
      enable = true;
    };

    fidget = {
      enable = true;
      notification.window.winblend = 0;
    };
  };
}
