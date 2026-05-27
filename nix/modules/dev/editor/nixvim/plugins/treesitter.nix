{
  plugins = {
    treesitter = {
      enable = true;

      settings = {
        ensure_installed = [
          "caddy"
        ];
        highlight = {
          enable = true;
        };
      };

      nixvimInjections = true;
    };

    treesitter-context = {
      enable = false;
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
        };
      };
    };
  };
}
