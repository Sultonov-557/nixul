{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ cursor-cli ]; }
