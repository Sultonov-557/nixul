{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ gcc ]; }
