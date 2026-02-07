{
  plugins = {
    comment = {
      enable = true;
      settings = {
        opleader.line = "gc";
        opleader.block = "gb";
        toggler.line = "gcc";
        toggler.block = "gbc";
      };
    };

    mini-surround = {
      enable = true;
      settings = {
        mappings = {
          add = "sa";
          delete = "sd";
          find = "sf";
          find_left = "sF";
          highlight = "sh";
          replace = "sr";
          suffix_last = "l";
          suffix_next = "n";
        };
      };
    };

    ts-context-commentstring = {
      enable = true;
    };
  };
}
