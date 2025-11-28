{ ... }:

{
  home.stateVersion = "24.05";

  # Minimal GNOME settings can go here
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.nixvim = {
    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
    };
  };
}
