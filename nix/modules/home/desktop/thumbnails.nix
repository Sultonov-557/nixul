{ pkgs, ... }:

{
  services.tumbler.enable = true;

  home.packages = with pkgs; [
    ffmpegthumbnailer
    poppler_utils
    libgsf
  ];
}
