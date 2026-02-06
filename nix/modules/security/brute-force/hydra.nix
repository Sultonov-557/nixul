{ pkgs, ... }: { environment.defaultPackages = with pkgs; [ hydra ]; }
