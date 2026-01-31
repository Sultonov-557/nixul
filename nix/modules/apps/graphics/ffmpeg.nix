{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ ffmpeg ];
}
