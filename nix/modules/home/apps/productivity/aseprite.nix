{ pkgs, ... }: {
  home.packages = with pkgs;
    [ aseprite ]; # TODO move this stuff to correct folder
}
