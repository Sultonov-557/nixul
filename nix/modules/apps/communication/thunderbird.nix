{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ thunderbird ]; }
