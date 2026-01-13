{ pkgs, lib, config, ... }: {
  home.packages = with pkgs; [
    nodePackages_latest.nodejs
    prisma
    prisma-engines
  ];
}
