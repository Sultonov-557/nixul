{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ wordlists ]; }
