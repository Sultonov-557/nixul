{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ bruno ]; }
