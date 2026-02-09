{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.nix-index-database = {
    comma.enable = true;
  };

  environment.systemPackages = with pkgs; [ comma ];

  programs.command-not-found.enable = false;
}
