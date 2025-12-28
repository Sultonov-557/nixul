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

        # Additional language servers
        gopls.enable = true;
        clangd.enable = true;
        bashls.enable = true;
        yamlls.enable = true;
        dockerls.enable = true;
        marksman.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gt = {
            action = "type_definition";
            desc = "Goto Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          gK = {
            action = "signature_help";
            desc = "Signature Help";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "[d" = {
            action = "goto_prev";
            desc = "Prev Diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
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
      settings = {
        notification.window.winblend = 0;
      };
    };
  };
}
