{ pkgs, ... }:

{
  home.packages = with pkgs; [ kotatogram-desktop ];
}
