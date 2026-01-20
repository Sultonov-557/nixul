{ pkgs, ... }: {
  programs.bun = { enable = true; };

  home.packages = with pkgs; [ bun ];
}
