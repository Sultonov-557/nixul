{ ... }: {
  programs.nixvim = {
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        transparent_background = true;
        contrast = "soft";
      };
    };
  };
}

