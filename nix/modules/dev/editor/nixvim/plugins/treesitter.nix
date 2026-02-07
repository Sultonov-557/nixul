{
  plugins = {
    treesitter = {
      enable = true;

      settings = {
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
