{ pkgs, ... }:
{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 2000;
        };
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          rust = [ "rustfmt" ];
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
  ];
}
