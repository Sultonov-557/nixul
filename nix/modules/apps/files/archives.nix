{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ p7zip unzip zip file-roller ];
}
