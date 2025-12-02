{ pkgs, ... }:

{
  system.nixos.label = null;

  imports = [
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./audio.nix
  ];

  # User Configuration
  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

  # System State Version
  system.stateVersion = "25.11";
}
