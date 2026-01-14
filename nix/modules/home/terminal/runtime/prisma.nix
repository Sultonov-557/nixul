{ pkgs, ... }: { home.packages = with pkgs; [ prisma prisma-engines ]; }
