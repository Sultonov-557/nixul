{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ katana ]; }
