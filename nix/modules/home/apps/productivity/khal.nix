{ pkgs, ... }: {
  programs.khal = { enable = true; };

  home.packages = with pkgs; [ khal ];
}
