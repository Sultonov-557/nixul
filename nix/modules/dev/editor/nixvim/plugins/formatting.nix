{ pkgs, ... }: {
  plugins = {
    none-ls = {
      enable = true;
      enableLspFormat = true;
      settings.update_in_insert = false;
      sources = {
        formatting = {
          nixfmt = { enable = true; };
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            settings = ''
              {
                extra_args = { "--no-semi", "--single-quote" },
              }
            '';
          };
          stylua.enable = true;
          black.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          pylint.enable = true;
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 500;
        };
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
          javascriptreact = [ "prettier" ];
          typescriptreact = [ "prettier" ];
          json = [ "prettier" ];
          yaml = [ "prettier" ];
          markdown = [ "prettier" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          lua = [ "stylua" ];
          python = [ "black" ];
        };
      };
    };
  };

  extraPackages = with pkgs; [
    nixfmt-rfc-style
    nodePackages.prettier
    stylua
    black
    statix
    deadnix
    pylint
    nodePackages.eslint_d
  ];
}
