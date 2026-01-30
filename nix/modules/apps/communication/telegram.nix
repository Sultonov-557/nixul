{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ telegram-desktop ];
}
