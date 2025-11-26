{ pkgs, lib, ... }:
{
  xdg.configFile."nvim" = {
    source = ../config/neovim;
    recursive = true;
  };

  home.packages = with pkgs; [
    psmisc
    gcc
    lazygit
    lazydocker
    tree-sitter
    cargo
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

}
