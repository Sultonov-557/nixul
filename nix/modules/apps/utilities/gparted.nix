{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ gparted ];
}
