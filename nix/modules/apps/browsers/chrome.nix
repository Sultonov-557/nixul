{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ google-chrome ];
}
