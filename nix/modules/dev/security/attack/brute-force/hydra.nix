{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ thc-hydra ];
}
