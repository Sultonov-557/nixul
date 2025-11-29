{
  programs.nixvim = {
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

      nvim-surround = {
        enable = true;
      };

      flash = {
        enable = true;
        settings = {
          labels = "asdfghjklqwertyuiopzxcvbnm";
          search = {
            multi_window = true;
            forward = true;
            wrap = true;
          };
          jump.autojump = false;
          label = {
            uppercase = false;
            rainbow.enabled = true;
          };
          modes = {
            search.enabled = true;
            char.enabled = false;
          };
        };
      };

      mini = {
        enable = true;
        modules = {
          ai = {
            n_lines = 500;
          };
        };
      };

      ts-context-commentstring = {
        enable = true;
      };
    };

    keymaps = [
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "s";
        action.__raw = "require('flash').jump";
        options.desc = "Flash";
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "S";
        action.__raw = "require('flash').treesitter";
        options.desc = "Flash Treesitter";
      }
    ];
  };
}
