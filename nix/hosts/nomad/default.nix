{ inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./home.nix
    ../../modules/system
  ];

  home-manager.sharedModules = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home
  ];
}
