{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ aseprite ];
}
