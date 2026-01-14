{ pkgs, ... }: {
  services.cliphist.enable = true;

  home.packages = with pkgs; [ cliphist wl-clipboard ];
}
