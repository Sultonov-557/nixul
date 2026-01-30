{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ dbeaver-bin ]; }
