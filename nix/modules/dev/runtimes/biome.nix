{ pkgs, ... }: {

  environment.defaultPackages = with pkgs; [ biome ];
}
