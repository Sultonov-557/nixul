{ pkgs, ... }: {
  programs.yazi.enable = true;
  home.packages = with pkgs; [ yazi ];
}
