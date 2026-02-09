{ inputs, pkgs, ... }:
{
  environment.systemPackages = [ inputs.nix-ai.packages.${pkgs.system}.default ];
}
